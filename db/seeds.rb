require 'json'
require 'openai'

# isbn13_array = []
# url = "https://api2.isbndb.com/books/inspirational?page=1&pageSize=50&column=title&language=en&shouldMatchAll=0"

# url = "https://api2.isbndb.com/book/9781524763138"

# response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
# book_data = JSON.parse(response.body)

# p book_data

# title = book_data["book"]["title"] || book_data["book"]["title_long"]
# description = book_data["book"]["synopsis"]
# author = (book_data["book"]["authors"]).join(", ")
# category = (book_data["book"]["subjects"]).join(", ")
# number_of_pages = (book_data["book"]["pages"]).to_i
# publish_date = book_data["book"]["date_published"]
# cover_image = book_data["book"]["image"]
# api_id = (book_data["book"]["isbn13"]).to_s
# publisher = book_data["book"]["publisher"]


# new_book = Book.new(title: title, description: description, author: author,
#                     category: category, number_of_pages: number_of_pages,
#                     publish_date: publish_date, cover_image: cover_image,
#                     api_id: api_id, publisher: publisher)

# new_book.save!

# p "Book created!"

# METHOD TO GENERATE ISBN USING OPEN AI BASED ON USER'S INPUT

# def getISBN(answer_mood, answer_style, answer_length, answer_category, answer_year)
#   client = OpenAI::Client.new
#   chatgpt_response = client.chat(parameters: {
#     model: "gpt-4o-mini",
#     messages: [{ role: "user", content: "Please, give me ONLY an array containing ISBN numbers of 5 BOOKS available on ISBN DB that match the following:
#   #{answer_mood}
#   #{answer_style}
#   around #{answer_length} pages
#   #{answer_category}
#   published around #{answer_year}

#   Do not return anything else than the array. List from the most relevant to the least relevant. Also add a reason (from 200 to 400 characters) about why this suggestion was given. Do not start the reason with 'This ISBN...'

#   Return it in an array of ruby hashes (Keys ISBN and Reason) with 5 items. Remove ```ruby from the final results on the beginning and end.
#   " }]
#     })
#   results = chatgpt_response["choices"][0]["message"]["content"]

#   converted_results = eval(results)
#   p converted_results
#   find_book(converted_results)
# end

# METHOD TO FIND AND CREATE BOOK INSTANCE BASED ON THE RECOMMENDATIONS FROM OPEN AI

# def find_book(array_of_ISBN)
#   array_of_ISBN.each do |book|
#     url = "https://api2.isbndb.com/book/#{book[:ISBN]}"

#     response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)

#     book_data = JSON.parse(response.body)

#     p book_data

#     if book_data["errorMessage"] == "Not Found"
#       puts "unable to find book"
#     elsif Book.find_by(api_id: (book_data["book"]["isbn13"]).to_s)
#       puts "Book already exists in the database"
#     else
#       p title = book_data["book"]["title"] || book_data["book"]["title_long"]
#       p description = book_data["book"]["synopsis"]
#       p author = (book_data["book"]["authors"]).join(", ")
#       p category = (book_data["book"]["subjects"]).join(", ")
#       p number_of_pages = (book_data["book"]["pages"]).to_i
#       p publish_date = book_data["book"]["date_published"]
#       p cover_image = book_data["book"]["image"]
#       p api_id = (book_data["book"]["isbn13"]).to_s
#       p publisher = book_data["book"]["publisher"]

#       new_book = Book.new(title: title, description: description, author: author,
#                       category: category, number_of_pages: number_of_pages,
#                       publish_date: publish_date, cover_image: cover_image,
#                       api_id: api_id, publisher: publisher)

#       new_book.save!

#       p "Book created!"
#     end
#   end
# end

# getISBN("Inspirational", "best seller", "250", "novel", "2010")

# *****
# url = "https://api2.isbndb.com/books/#{'fantasy'}?page=1&pageSize=2&column=title&language=en&shouldMatchAll=0"

# response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
# book_data = JSON.parse(response.body)

# book_data_array = book_data["books"]
# book_data_array.each_with_index do |isbn, i|
#   isbn13_array.push(isbn["isbn13"]) if isbn["isbn13"]
# end
# # p book_data_array
# # p isbn13_array

# def getISBN(isbn13_array, answer_category , answer_length, answer_year)
#     client = OpenAI::Client.new
#     chatgpt_response = client.chat(parameters: {
#       model: "gpt-4o-mini",
#       messages: [{ role: "user", content: "
#     Please give me 10 books which ISBN-13 number should be must from the #{isbn13_array} array and match the following:

#     around #{answer_length} pages
#     category #{answer_category}
#     published around #{answer_year}

#     Do not return anything else than the array. List from the most relevant to the least relevant. Also add a reason (from 200 to 400 characters) about why this suggestion was given.

#     Return it in an array of ruby hashes (only with Keys ISBN and Reason)."
#     }]
# })
#     results = chatgpt_response["choices"][0]["message"]["content"][7..-4]
#     converted_results = eval(results)
#       # p converted_results
#     converted_results.each do |result|
#       # p result[:ISBN]
#       # p isbn13_array
#       isbn13_array.include?(result[:ISBN])
#           find_book(result[:ISBN]) if isbn13_array.include?(result[:ISBN])
#     end
# end

# def find_book(isbn13)
#     url = "https://api2.isbndb.com/book/#{isbn13}"
#     response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)

#     book_data = JSON.parse(response.body)

#     p book_data

#     if book_data["errorMessage"] == "Not Found"
#       puts "unable to find book"
#     elsif Book.find_by(api_id: (book_data["book"]["isbn13"]).to_s)
#       puts "Book already exists in the database"
#     else
#       p title = book_data["book"]["title"] || book_data["book"]["title_long"]
#       p description = book_data["book"]["synopsis"]
#       p author = (book_data["book"]["authors"]).join(", ")
#       p category = (book_data["book"]["subjects"]).join(", ")
#       p number_of_pages = (book_data["book"]["pages"]).to_i
#       p publish_date = book_data["book"]["date_published"]
#       p cover_image = book_data["book"]["image"]
#       p api_id = (book_data["book"]["isbn13"]).to_s
#       p publisher = book_data["book"]["publisher"]

#       new_book = Book.new(title: title, description: description, author: author,
#                       category: category, number_of_pages: number_of_pages,
#                       publish_date: publish_date, cover_image: cover_image,
#                       api_id: api_id, publisher: publisher)

#       new_book.save!

#       p "Book created!"
#     end
# end


# getISBN(isbn13_array, "novel", "250" , "2010")

Answer.destroy_all
Question.destroy_all

p "Questions removed"

question_1 = Question.new(content: "What emotion are you looking to experience?", answer_1: "Inspiration", answer_2: "Suspense", answer_3: "Joy", answer_4: "Love", answer_5: "Emotional" )
question_1.save
question_2 = Question.new(content: "Choose a book category", answer_1: "Best-seller", answer_2: "Classic", answer_3: "Contemporary", answer_4: "Alternative", answer_5: "BookTok trend" )
question_2.save
question_3 = Question.new(content: "How much reading are you in the mood for?", answer_1: "Short book", answer_2: "Long book", answer_3: "Open to both")
question_3.save
question_4 = Question.new(content: "Pick one of your preference", answer_1: "Fiction", answer_2: "Non-fiction")
question_4.save
question_5 = Question.new(content: "What's your preferred publication date?", answer_1: "New releases", answer_2: "Old but gold", answer_3: "It doesn't matter" )
question_5.save

puts "questions created!"


community = Community.new(name: "Get inspired", description: "Time to get inspired together", image: "https://booksthatmakeyou.com/wp-content/uploads/2023/08/Ways_to_Help_Create_a_Relaxing_Atmosphere.jpg")
community.save
p "Added Get inspired community"

community = Community.new(name: "Relaxing reads", description: "Relax and enjoy you fav readings", image: "https://booksthatmakeyou.com/wp-content/uploads/2023/08/Ways_to_Help_Create_a_Relaxing_Atmosphere.jpg")
community.save
p "Added Relaxing reads community"
