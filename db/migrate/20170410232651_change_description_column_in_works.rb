class ChangeDescriptionColumnInWorks < ActiveRecord::Migration[5.0]
  def change
    rename_column :works, :desciption, :description

  end
end
