class UserCommunitiesController < ApplicationController

  def index
    @user_communities = current_user.communities
  end

  def create
    @community = Community.find(params[:id])
    @user_community = UserCommunity.new
    @user_community.user_id = current_user.id
    @user_community.community_id = @community.id

    if @user_community.save
      redirect_to user_communities_path, notice: "You've joined a book community"
    else
      redirect_to book_path(@book), alert: 'Unable to join this community.'
    end
  end
end
