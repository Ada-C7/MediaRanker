class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes

  validates :title, presence: true, uniqueness: true
  validates :created_by, presence: true

  validates :category, presence: true , inclusion: { in: %w(album movie book)}

  def self.show_category(cat)
    chosen = []
    all = Work.all
    all.each{|item| item.category == cat ? (chosen << item ): next}
    return chosen
  end

  def user_votes
    final_votes = {}
    all_votes = self.votes

    all_votes.each do |vote|
      final_votes[User.find(vote.user_id).username] = vote.created_at.to_date
    end
    return final_votes
  end
end
