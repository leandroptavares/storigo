class Review < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :comment, :rating, :book_id, :user_id, presence: true
  validates :comment, length: { maximum: 500 }
  validates :comment, length: { minimum: 10 }
end
