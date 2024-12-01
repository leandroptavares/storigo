class RemoveUserCommunitiesFromMessages < ActiveRecord::Migration[7.1]
  def change
    remove_reference :messages, :user_communities, foreign_key: true
  end
end
