class AddVotesCacheToWork < ActiveRecord::Migration[5.0]
  def change
    add_column :works , :votes_count , :integer , :default => 0
    Work.reset_column_information
    Work.all.each do |work|
      Work.update_counters work.id , :votes_count => work.votes.length
    end
  end
  end
