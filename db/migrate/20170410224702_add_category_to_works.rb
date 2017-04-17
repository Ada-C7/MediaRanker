class AddCategoryToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :category, :string
  end
end
