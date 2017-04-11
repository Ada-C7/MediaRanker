class Work < ApplicationRecord
  validates :title, presence: true
  validates :mediatype, presence: true

  def top_spotlight
    # select work with the most votes
    # how will it handle a tie?
  end


  # to think about for all:
  # what if there are less than 10 works in mediatype category
  # what if more than one have same number of votes
  # how will it handle if votes count = 0

  def top_movies
    # find all works that have a mediatype of 'movie'
    # sort from highest number of votes to lowest number of votes
    # select top 10 movies
  end

  def top_books
    # find all works that have a mediatype of 'book'
    # sort from highest number of votes to lowest number of votes
    # select top 10 books
  end

  def top_albums
    # find all works that have a mediatype of 'album'
    # sort from highest number of votes to lowest number of votes
    # select top 10 albums
  end
end
