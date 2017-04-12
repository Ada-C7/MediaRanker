class Work < ApplicationRecord

  def self.books
    Work.where(category: "book")
  end

  def self.albums
    Work.where(category: "album")
  end

  def self.movies
    Work.where(category: "movies")
  end
end
