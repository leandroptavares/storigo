class BooksController < ApplicationController
  def index
    if params[:search].present?
      user_input = params[:search]
    # Search by title
    # url = "https://api2.isbndb.com/books/#{user_input}?page=1&pageSize=20&column=title&language=en&shouldMatchAll=0"
    #Search by category
    # url = "https://api2.isbndb.com/subject/#{user_input}"
    #Search by author
    url = "https://api2.isbndb.com/author/#{user_input}?page=1&pageSize=20"

      response = HTTP.headers("Content-Type": "application/json", "Authorization": ENV["ISBN_DB_API"]).get(url)
      books = JSON.parse(response.body)
      @books_ai = books["books"]
      @books_ai.each do |book_data|
        create(book_data)
      end
    else
      @books_ai = Book.all.sample(10)
    end

  end

  def new
    @book = Book.new
  end

  def create(book_data)
    if Book.where(title: book_data["title"]) == []
      @book = Book.create(
      title: book_data["title"],
      author: book_data["authors"],
      description: book_data["synopsis"],
      category: book_data["subjects"],
      number_of_pages: book_data["pages"],
      publish_date: book_data["date_published"],
      cover_image: book_data["image"],
      api_id: book_data["isbn13"]
      )
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :author, :category, :number_of_pages, :publish_date, :cover_image, :subtitle, :api_id)
  end
end
