class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: [ :home ]

  def home
    unless current_user.surveys.empty?
      @survey = Survey.where(user: current_user)
      @survey.destroy_all
    end

    @survey = Survey.new
    @survey.user = current_user
    @survey.save

    @questions = Question.all
    @answer = Answer.new

    @books = Book.all
    @communities = Community.all
  end

  def my_profile
  end

  def user_profile
    @user_profile = User.find(params[:user_id])
  end

end
