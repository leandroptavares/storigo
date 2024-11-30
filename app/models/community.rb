class Community < ApplicationRecord
  has_many :user_communities
  validates :name, :description, presence: true
end
