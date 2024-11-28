class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def getRecommendations(mood)
  url = "https://api2.isbndb.com/books/#{mood}?page=1&pageSize=50&column=subject&language=en&shouldMatchAll=0"

  response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
  book_data = JSON.parse(response.body)

  isbn13_numbers = book_data["books"].map { |item| item["isbn13"] }

  end

  def createBook(isbn13)

    url = "https://api2.isbndb.com/book/#{isbn13}"

    response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
    book_data = JSON.parse(response.body)

    p book_data

    if book_data["errorMessage"] == "Not Found" || book_data["message"] == "Forbidden"
      puts "Unable to find book"
    elsif book_data["book"]["isbn13"].blank? && book_data["book"]["isbn"].blank?
      puts "Untrackable book... no ISBN"
    elsif Book.find_by(api_id: (book_data["book"]["isbn13"].presence || book_data["book"]["isbn"].presence).to_s)
      puts "Book already exists in the database"
    else
      title = book_data["book"]["title"] || book_data["book"]["title_long"]
      description = book_data["book"]["synopsis"]
      author =  if book_data["book"]["authors"] && !book_data["book"]["authors"].empty?
                    book_data["book"]["authors"].join(", ")
                else
                    book_data["book"]["authors"]
                end
      category =  if book_data["book"]["subjects"] && !book_data["book"]["subjects"].empty?
                      book_data["book"]["subjects"].join(", ")
                  else
                      "No categories available"
                  end
      number_of_pages = book_data["book"]["pages"].to_i
      publish_date = book_data["book"]["date_published"]
      cover_image = book_data["book"]["image"]
      api_id = book_data["book"]["isbn13"].to_s || book_data["book"]["isbn"].to_s
      publisher = book_data["book"]["publisher"]

      new_book = Book.new(
        title: title,
        description: description,
        author: author,
        category: category,
        number_of_pages: number_of_pages,
        publish_date: publish_date,
        cover_image: cover_image,
        api_id: api_id,
        publisher: publisher
      )

      new_book.save!
      p "Book created!"
    end

  end

  def getISBNorder(isbn13_array, answer_category, answer_length, answer_style, answer_year)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "
      Please give me 10 books which ISBN-13 number should be must from the #{isbn13_array} array and match the following:

      category: #{answer_category}
      around #{answer_length} pages
      style: #{answer_style}
      published #{if answer_year == "New releases"
                    "after 2020"
                  elsif answer_year == "Old but gold"
                    "before 2000"
                  else
                    "in any year"
                  end}


      Do not return anything else than the array. List from the most relevant to the least relevant. Also add a reason (from 200 to 400 characters) about why this suggestion was given.

      Return it in an array of ruby hashes (only with Keys ISBN and Reason)."
      }]
    })

    results = chatgpt_response["choices"][0]["message"]["content"][7..-4]
    converted_results = eval(results)

    converted_results.each do |result|
      isbn13_array.include?(result[:ISBN])
      createBook(result[:ISBN]) if isbn13_array.include?(result[:ISBN])
    end
  end

end
