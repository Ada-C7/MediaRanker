class RenameMediatype < ActiveRecord::Migration[5.0]
  def change
    rename_column :works, :mediatype, :category
  end
end
