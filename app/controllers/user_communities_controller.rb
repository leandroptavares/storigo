class UserCommunitiesController < ApplicationController
  before_action :set_user_community, only: [:destroy]

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
      redirect_to communities_path(@community), alert: 'Unable to join this community.'
    end
  end

  def destroy
    @user_community.destroy
    redirect_to user_communities_path, status: :see_other, notice: "You unfollowed a community"
  end

  private

  def set_user_community
    @user_community = UserCommunity.find(params[:id])
  end
end
