class Work < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true

  has_many :votes
  has_many :users, through: :votes

  def self.ordered_works(category)
    works = Work.where(category: category)
    ordered_list = []
    if works.count > 0
      sorted = order_by_votes(works)
      sorted.each do |arr|
        ordered_list << works.find_by(id: arr[0])
      end
      return ordered_list
    else
      return []
    end
  end


  def self.order_by_votes(works)
    workId_numberOfVotes = {}
    if works.count > 0
      works.each do |work|
        workId_numberOfVotes[work.id] = work.votes.count
      end
      return workId_numberOfVotes.sort_by{|k,v| v }.reverse
    else
      []
    end
  end


end
