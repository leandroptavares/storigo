class Community < ApplicationRecord
  belongs_to :user
  has_many :user_communities
  validates :name, :description, :category, :user_id, presence: true
end
