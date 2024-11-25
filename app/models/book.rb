class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :user_books, dependent: :destroy
  has_many :user_reactions
  validates :title, :description, :author, :category,
            :number_of_pages, :publish_date, :cover_image, :api_id, presence: true
end
