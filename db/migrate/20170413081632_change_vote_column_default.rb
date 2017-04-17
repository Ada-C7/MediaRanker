class ChangeVoteColumnDefault < ActiveRecord::Migration[5.0]
  def change
    change_column :works, :votes, :integer, :default => 0
  end
end
