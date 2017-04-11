class Work < ApplicationRecord
  has_many :votes

  validates :category, presence: true, inclusion: { in: %w(movie book album),
    message: "%{value} is not a valid category" }, allow_nil: false
    validates :title, presence: true

    # returns the first work object with the most votes: class method
    def self.spotlight
      works = Work.all
      max_vote = 0
      spotlight_work = nil
      works.each do |work|
        vote_count = work.votes.size
        if vote_count > max_vote
          max_vote = vote_count
          spotlight_work = work
        end
      end

      if spotlight_work == nil
        return Work.all.sample
      else
        return spotlight_work
      end
    end



  end
