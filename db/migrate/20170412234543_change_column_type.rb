class ChangeColumnType < ActiveRecord::Migration[5.0]
  def change
    change_column :works, :publication_year, :string
  end
end
