class BooksController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_item, only: [:show]

  def show
  end

  def discover
    # render partial: "books/discover"
  end

  def recommendation
    @user_survey = current_user.surveys.first
    @api_recommendations = getRecommendations(@user_survey.answers.first.content)
    @open_ai_recommendation = getISBNorder(@api_recommendations, @user_survey.answers.second.content, @user_survey.answers.third.content, @user_survey.answers.fourth.content, @user_survey.answers.fifth.content)
    @books = Book.where(api_id: @open_ai_recommendation.map { |book| book[:ISBN] })

    @books_with_reasons = @books.map do |book|
      reason = @open_ai_recommendation.find { |b| b[:ISBN] == book.api_id }[:Reason]
      { book: book, reason: reason }
    end
  end

  private

  def set_item
    @book = Book.find(params[:id])
  end
end
