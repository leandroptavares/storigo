class Book < ApplicationRecord
  has_many :reviews
  has_many :user_books
  has_many :user_reactions
end
