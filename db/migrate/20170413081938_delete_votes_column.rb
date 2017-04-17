class DeleteVotesColumn < ActiveRecord::Migration[5.0]
  def change
    remove_column :works, :votes, :integer
  end
end
