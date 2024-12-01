class RemoveBookIdFromCommunities < ActiveRecord::Migration[7.1]
  def change
    remove_column :communities, :book_id
  end
end
