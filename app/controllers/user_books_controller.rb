class UserBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:destroy]

  def index
    @user_books = current_user.books
  end

  def create
    @book = Book.find(params[:id])
    @user_book = UserBook.new
    @user_book.user_id = current_user.id
    @user_book.book_id = @book.id
    @user_book.save

    # if @user_book.save
    #   redirect_to user_books_path, notice: 'Book added to your bookshelf.'
    # else
    #   redirect_to book_path(@book), alert: 'Unable to add the book to your bookshelf.'
    # end
  end

  def destroy
    @book.destroy
    redirect_to user_books_path, status: :see_other
  end

  private

  def set_book
    @user_book = UserBook.find(params[:id])
  end
end
