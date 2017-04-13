class AddVoteForeignKeys < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :votes, foreign_key: true
    add_reference :works, :votes, foreign_key: true
  end
end
