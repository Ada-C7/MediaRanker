class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true

  def self.books
    @books = Work.where(media_type: 'book')
  end

  def self.albums
    @albums = Work.where(media_type: 'album')
  end

  def self.movies
    @movies = Work.where(media_type: 'movie')
  end
end
