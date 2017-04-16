class AddColumnsToAlbums < ActiveRecord::Migration[5.0]
  def change
    add_column :albums, :category, :string
    add_column :albums, :title, :string
    add_column :albums, :creator, :string
    add_column :albums, :publication_year, :string
    add_column :albums, :description, :string
  end
end
