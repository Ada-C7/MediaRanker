class AddColumns < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :category, :string
    add_column :works, :title, :text
    add_column :works, :publication_year, :integer
    add_column :works, :description, :text
  end
end
