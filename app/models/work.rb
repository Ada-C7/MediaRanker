class Work < ApplicationRecord
  validates :title, presence: true
  validates :category, inclusion: { in: ["book", "movie", "album"] }

  def self.movies
    return where(category: "movie")
  end

  def self.albums
    return where(category: "album")
  end

  def self.books
    return where(category: "book")
  end
end
