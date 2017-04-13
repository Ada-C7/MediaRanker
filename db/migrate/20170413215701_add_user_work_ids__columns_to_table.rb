class AddUserWorkIdsColumnsToTable < ActiveRecord::Migration[5.0]
  def change
    add_column :votes, :work_id, :string
    add_column :votes, :user_id, :string
  end
end
