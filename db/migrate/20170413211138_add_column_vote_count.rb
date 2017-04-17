class AddColumnVoteCount < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :vote_count, :integer, :default => 0
  end
end
