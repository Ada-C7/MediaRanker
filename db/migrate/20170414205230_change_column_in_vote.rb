class ChangeColumnInVote < ActiveRecord::Migration[5.0]
  def change
    rename_column :votes, :vote_id, :item_id
  end
end
