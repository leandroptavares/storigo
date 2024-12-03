class ReviewsController < ApplicationController
    def create
      @book = Book.find(params[:book_id])
      if !current_user
        redirect_to book_path(@book), notice: "Please login first"
        return
      end
      @book = Book.find(params[:book_id])
      @review = @book.reviews.new(review_params)
      @review.user = current_user
      if @review.save
        redirect_to book_path(@book)
      else
        redirect_to book_path(@book), alert: "Couldn't create review"
      end
    end

    def destroy
      @review = Review.find(params[:id])
      book = @review.book
      @review.destroy
      redirect_to book_path(book)
    end

    private

    def review_params
        params.require(:review).permit(:comment, :rating, :book_id)
    end
  end
