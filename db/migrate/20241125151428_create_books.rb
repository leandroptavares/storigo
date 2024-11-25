class CreateBooks < ActiveRecord::Migration[7.1]
  def change
    create_table :books do |t|
      t.string :title
      t.string :subtitle
      t.text :description
      t.string :author
      t.string :category
      t.integer :number_of_pages
      t.date :publish_date
      t.string :cover_image
      t.integer :api_id

      t.timestamps
    end
  end
end
