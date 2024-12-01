class Message < ApplicationRecord
  belongs_to :user
  belongs_to :community

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_prepend_to "community_#{community.id}_messages",
                        partial: "messages/message",
                        target: "messages",
                        locals: { message: self }
  end
end
