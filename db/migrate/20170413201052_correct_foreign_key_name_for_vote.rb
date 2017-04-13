class CorrectForeignKeyNameForVote < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :votes_id
    remove_column :users, :votes_id
    add_reference :users, :vote, foreign_key: true
    add_reference :works, :vote, foreign_key: true
  end
end
