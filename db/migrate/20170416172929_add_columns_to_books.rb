class AddColumnsToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :category, :string
    add_column :books, :title, :string
    add_column :books, :creator, :string
    add_column :books, :publication_year, :string
    add_column :books, :description, :string
  end
end
