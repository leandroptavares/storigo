class ChangeBooksApiId < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :api_id, :string
  end
end
