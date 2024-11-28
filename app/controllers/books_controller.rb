class BooksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_item, only: [:show]

  def show
  end

  def discover
    render partial: "books/discover"
  end
  private

  def set_item
    @book = Book.find(params[:id])
  end
end
