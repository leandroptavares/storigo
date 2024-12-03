class UserReactionsController < ApplicationController

  def index
    @user_reactions = current_user.user_reactions
  end

  def create
    @user_reaction = UserReaction.new(user_reaction_params)
    @user_reaction.user_id = current_user.id
    if @user_reaction.save
      render json: { message: "Created", user_reaction: @user_reaction }, status: :created
    end
  end

  private

  def user_reaction_params
    params.require(:user_reaction).permit(:like, :book_id)
  end
end
