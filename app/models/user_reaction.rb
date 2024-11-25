class UserReaction < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, :book_id, :like, presence: true
end
