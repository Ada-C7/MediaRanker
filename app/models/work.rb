class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

  def self.find_top_ten_movies
    movies = Work.all.where(category: "movie")
    return helper(movies)
  end

  def self.find_top_ten_books
    books = Work.all.where(category: "book")
    return helper(books)
  end

  def self.find_top_ten_albums
    albums = Work.all.where(category: "album")
    return helper(albums)
  end

  def self.find_top
    Work.all.sort_by { |work| work.votes.count }.reverse[0]
  end

  def self.helper(works)
    works.sort_by { |work| work.votes.count }.reverse[0..9]
  end
end
