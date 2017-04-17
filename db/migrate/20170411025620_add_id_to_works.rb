class AddIdToWorks < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :work_id, :integer
  end
end
