class ChangeBooksPublishDate < ActiveRecord::Migration[7.1]
  def change
    change_column :books, :publish_date, :string
  end
end
