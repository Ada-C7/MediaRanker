class AddVotesColumn < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :votes, :integer
  end
end
