class UserCommunity < ApplicationRecord
  belongs_to :user
  belongs_to :community

  validates :user_id, :community_id, presence: true
end
