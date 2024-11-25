class Community < ApplicationRecord
  belongs_to :book
  belongs_to :user
  validates :name, :description, :category, :user_id, presence: true
  
end
