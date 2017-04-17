class RenameColumns < ActiveRecord::Migration[5.0]
  def change
    rename_column :works, :string, :created_by
  end
end
