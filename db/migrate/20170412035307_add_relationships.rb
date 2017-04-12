class AddRelationships < ActiveRecord::Migration[5.0]
  def change
    add_reference :votes, :user, index: true
    add_reference :votes, :work, index: true
  end
end
