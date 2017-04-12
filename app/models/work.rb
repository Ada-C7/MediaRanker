class Work < ApplicationRecord
  has_many :votes

  def self.spotlight
    works = Work.all
    works.max_by { |work| work.votes.count} #convert array of work into an array
  end
end
