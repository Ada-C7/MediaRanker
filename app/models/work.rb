class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

  # if you are writing a class method you can just use the build in where method...
  def self.find_movies
    # this will return an array
    Work.all.map{ |media| media if media.category == "movie"}.compact

    # this will return a active record relation
    # Work.where(category: "movie")
  end
end
