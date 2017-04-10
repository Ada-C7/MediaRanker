class ChangeTypeToCategory < ActiveRecord::Migration[5.0]

  def change

    remove_column :works, :type
    add_column :works, :category, :string
  end
end
