class AddVotesColumnWithDefault < ActiveRecord::Migration[5.0]
  def change
    add_column :works, :votes, :integer, :default => 0
  end
end
