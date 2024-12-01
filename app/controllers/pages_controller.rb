class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    unless current_user.surveys.empty?
      @survey = Survey.where(user: current_user)
      @survey.first.destroy
    end

    @survey = Survey.new
    @survey.user = current_user
    @survey.save

    @questions = Question.all
    @answer = Answer.new

    @books = Book.all
    @communities = Community.all
  end

  def profile
  end

end
