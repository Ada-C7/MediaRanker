class Work < ApplicationRecord
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true

  has_many :votes
  has_many :users, through: :votes

  def ordered_works(category)
    works = Work.where(category: category)
    workId_numberOfVotes = {}
    if works > 0
      
    end


  end


end
