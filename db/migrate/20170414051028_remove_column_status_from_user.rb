class RemoveColumnStatusFromUser < ActiveRecord::Migration[5.0]
  def change
       remove_column :users, :status, :boolean
  end
end
