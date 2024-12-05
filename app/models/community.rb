class Community < ApplicationRecord
  has_many :user_communities, dependent: :destroy
  has_many :users, through: :user_communities
  has_many :messages, dependent: :destroy
  validates :name, :description, presence: true
end
