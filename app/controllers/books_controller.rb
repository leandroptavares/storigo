class BooksController < ApplicationController



  private

  def getISBN(genre, year, page)
    client = OpenAI::Client.new
    chatgpt_response = client.chat(parameters: {
      model: "gpt-4o-mini",
      messages: [{ role: "user", content: "Please, give me ONLY an array containing ISBN-13 of 10 books available on the ISBN DB that match the following:
      #{genre}
      #{page}
      Famous personalities
      released around #{year}
      novel

      Do not return anything else than the array. List from the most relevant to the least relevant. Also add a reason (from 200 to 400 characters) about why this suggestion was given.

      Return it in an array of ruby hashes (Keys ISBN and Reason).
      " }]
    })
    results = chatgpt_response["choices"][0]["message"]["content"]
    find_book(results)
  end

  def find_book(array_of_ISBN)
    array_of_ISBN.each_with_index do |book, i|
      url = "https://api2.isbndb.com/book/#{array_of_ISBN[i][:ISBN]}"

      response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
      book_data = JSON.parse(response.body)

      p title = book_data["book"]["title_long"]
      p description = book_data["book"]["synopsis"]
      p author = (book_data["book"]["authors"]).join
      p category = (book_data["book"]["subjects"]).join
      p number_of_pages = (book_data["book"]["pages"]).to_i
      p publish_date = book_data["book"]["date_published"]
      p cover_image = book_data["book"]["image"]
      p api_id = (book_data["book"]["isbn13"]).to_s
      p publisher = book_data["book"]["publisher"]
    end
  end
end
