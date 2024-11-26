class AddColumnToBooks < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :publisher, :string
  end
end
