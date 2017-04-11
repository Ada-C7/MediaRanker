class Work < ApplicationRecord

  # def self.show_category
  #    @books = Work.where(category: "book")
  #   @albums = Work.where(category: "album")
  #   @movies = Work.where(category: "movie")
  #
  # end
  validates :category, presence: true
  validates :title, presence: true
  validates :creator, presence: true
  validates :publication_year, presence: true
  validates :description, presence: true

end
