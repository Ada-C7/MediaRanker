class DeleteVoteDateFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column(:users, :vote_date)
  end
end
