class AddColumnToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :category, :string
    add_column :works, :title, :string
    add_column :works, :creator, :string
    add_column :works, :publication_year, :string
    add_column :works, :desciption, :string
  end
end
