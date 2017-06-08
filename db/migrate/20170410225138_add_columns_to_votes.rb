class AddColumnsToVotes < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :user
    add_reference :votes, :work
  end
end
