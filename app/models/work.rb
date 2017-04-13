class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true

  validates :pub_yr, presence: true, numericality: { only_integer: true, greater_than: 0, :less_than => 2018 }, allow_nil: true

  def self.top_work
    all_works = Work.all
    votes = all_works.map { |work| work.votes.length }
    highest = votes.max
    return all_works.find { |work|  work.votes.length == highest }
  end

end
