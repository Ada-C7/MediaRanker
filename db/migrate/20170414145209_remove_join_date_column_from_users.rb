class RemoveJoinDateColumnFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :join_date, :date
  end
end
