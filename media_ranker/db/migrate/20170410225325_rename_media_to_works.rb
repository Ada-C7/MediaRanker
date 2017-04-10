class RenameMediaToWorks < ActiveRecord::Migration[5.0]
  def change
  rename_table :media, :works
  end
end
