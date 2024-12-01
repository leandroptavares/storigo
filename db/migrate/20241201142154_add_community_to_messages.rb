class AddCommunityToMessages < ActiveRecord::Migration[7.1]
  def change
    add_reference :messages, :community, null: false, foreign_key: true
  end
end
