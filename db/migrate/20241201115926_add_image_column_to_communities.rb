class AddImageColumnToCommunities < ActiveRecord::Migration[7.1]
  def change
    add_column :communities, :image, :string
  end
end
