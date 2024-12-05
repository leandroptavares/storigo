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

    @books = Book.all.sort_by {|b| b.user_reactions.count }.reverse
    @communities = Community.all

    # @trending_books = Book.where(id: [2100, 2350, 2372, 2380])
  end

  def my_profile
  end

  def user_profile
    @user_profile = User.find(params[:user_id])
  end

end
