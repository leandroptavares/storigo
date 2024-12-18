class Book < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :user_books, dependent: :destroy
  has_many :user_reactions
  has_many :users, through: :user_books
  validates :title, :description, :author, :category,
            :number_of_pages, :publish_date, :cover_image, :api_id, presence: true

  include PgSearch::Model
    pg_search_scope :search_by_title_and_author,
    against: [ :title, :author ],
    using: {
    tsearch: { prefix: true }
  }
end
