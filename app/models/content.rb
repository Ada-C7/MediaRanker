class Content < ApplicationRecord
  has_many :votes

  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates_inclusion_of :category, :in => %w( book movie album)

  def self.albums
    return Content.all.select { |c| c.category == "album"}
  end

  def self.movies
    return Content.all.select { |c| c.category == "movie"}
  end

  def self.books
    return Content.all.select { |c| c.category == "book"}
  end

  def self.sort_votes(arr)
    return arr.sort_by{ |c| -c.votes.length }
  end

end
