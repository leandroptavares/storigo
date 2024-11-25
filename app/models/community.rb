class Community < ApplicationRecord
  belongs_to :user
  has_many :user_communities
end
