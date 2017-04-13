class Work < ApplicationRecord
  has_many :votes
  belongs_to :user

  def self.spotlight
    works = Work.all
    works.max_by { |work| work.votes.count} #convert array of work into an array
  end

  def self.books #return an array of all the book
    where(category: "book")
  end

  def self.movies #return an array of all the book
    where(category: "movie")
  end

  def self.albums #return an array of all the book
    where(category: "album")
  end

  def self.top_movies
    movies.order(:votes).limit(10)
  end

  def self.top_albums
    albums.order(:votes).limit(10)
  end

  def self.top_books

  end

end
