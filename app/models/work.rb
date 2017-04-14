class Work < ApplicationRecord
  has_many :votes
  has_many :users, through: :votes
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  # validates :description, presence: true

  # validates :name, presence: true, length: { minimum: 2 }
  # validates :phone_num, presence: true

  def self.gather_movies
    return Work.where(category: "movie")
  end

#this is what "return Work.where(category: "movie")" does under the hood!!"
  # def self.gather_movies
  #   movies = []
  #   Work.each do
  #     if work.category == "movie"
  #       movies << work
  #     end
  #   end
  #   return movies
  # end

  def self.gather_books
    return Work.where(category: "book")
  end

  def self.gather_albums
    return Work.where(category: "album")
  end

  def self.vote_count
    if @work.vote.id.count == 0
      return 0
    else
      count = @work.vote.id.count
      return count
    end
  end

  def self.find_spotlight
    winner = []
    Work.all.each do
      if work.vote.count.max
        winner << work
        return winner
      end
    end
    # spotlight = Work.all.vote.count.max
  end

end
