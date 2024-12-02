class CommunitiesController < ApplicationController
  before_action :set_community, only: [:show]

  def index
    @communities = Community.all
  end

  def show
    @message = Message.new
    @messages = @community.messages.order(created_at: :desc)
  end

  private

  def set_community
    @community = Community.find(params[:id])
    @books = Book.all
  end
end
