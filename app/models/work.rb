class Work < ApplicationRecord
  has_many :votes

  validates :title, presence: true, uniqueness: true

  validates :pub_yr, presence: true, numericality: { only_integer: true, greater_than: 0, :less_than => 2018 }, allow_nil: true

  def self.top_work
    all_works = Work.all
    return all_works.max_by { |work| work.votes.count }
  end

end
