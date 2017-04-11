class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true, numericality: { only_integer: true }

  def find_movies
    # this will return an array
    Work.all.map{ |media| media if category == "movie"}.compact

    # this will return a active record relation
    # Work.where(category: "movie")
  end

  def find_books
  end

  def find_albumns
  end

end
