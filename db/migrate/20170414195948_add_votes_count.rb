class AddVotesCount < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :votes_count, :integer, default: 0
    remove_column :works, :vote_count, :integer
  end
end
