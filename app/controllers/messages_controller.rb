class MessagesController < ApplicationController
  def create
    @community = Community.find(params[:community_id])
    @message = Message.new(message_params)
    @message.community = @community
    @message.user = current_user

    if @message.save
      respond_to do |format|
        format.turbo_stream do
          render turbo_stream: turbo_stream.prepend(:messages, partial: "messages/message",
            target: "messages",
            locals: { message: @message, current_user: current_user })
        end
        format.html { redirect_to booking_path(@community) }
      end
    else
      render "communities/show", status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
