class Community < ApplicationRecord
  has_many :user_communities
  has_many :users, through: :user_communities
  validates :name, :description, presence: true
end
