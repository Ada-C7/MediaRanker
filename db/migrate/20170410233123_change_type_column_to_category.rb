class ChangeTypeColumnToCategory < ActiveRecord::Migration[5.0]
  def change
    rename_column :works, :type, :category
  end
end
