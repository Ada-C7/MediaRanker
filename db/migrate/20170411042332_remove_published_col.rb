class RemovePublishedCol < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :published
  end
end
