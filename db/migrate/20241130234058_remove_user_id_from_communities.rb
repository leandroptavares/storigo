class RemoveUserIdFromCommunities < ActiveRecord::Migration[7.1]
  def change
    remove_column :communities, :user_id
  end
end
