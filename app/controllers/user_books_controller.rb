class UserBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_book, only: [:destroy, :edit, :update]

  def index
    @user_books = current_user.books
  end

  def create
    @book = Book.find(params[:id])
    @user_book = UserBook.new
    @user_book.user_id = current_user.id
    @user_book.book_id = @book.id
    @user_book.status = "In progress"
    @user_book.pages_read = 0
    @user_book.save

    # if @user_book.save
    #   redirect_to user_books_path, notice: 'Book added to your bookshelf.'
    # else
    #   redirect_to book_path(@book), alert: 'Unable to add the book to your bookshelf.'
    # end
  end

  def edit
  end

  def update
    @user_book.update(user_book_params)
    if @user_book.save
      redirect_to user_books_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user_book.destroy
    redirect_to user_books_path, status: :see_other, notice: "Book removed from your bookshelf."
  end

  private

  def user_book_params
    params.require(:user_book).permit(:status)
  end

  def set_book
    @user_book = UserBook.find(params[:id])
  end
end
