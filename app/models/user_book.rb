class UserBook < ApplicationRecord
  belongs_to :user
  belongs_to :book
  validates :user_id, :book_id, presence: true
end
