class ChangeWorks < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :creator
    add_column :works, :user_id, :integer
  end

end
