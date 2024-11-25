class AddColumnsToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :image_url, :string
    add_column :users, :book_chosen, :integer
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
  end
end
