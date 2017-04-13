class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true, uniqueness: true

  validates :category, presence: true
  #
  # validates :isbn, uniqueness: true
  # def method_name
  #
  # end

  # def ranking_order
  #   @movies = Work.all.select {|work| work.category == "movie"}
  #   @movies.sort_by do |movie|
  #     movie.title
  #   end
  #
  #   @books = Work.all.select {|work| work.category == "book"}
  #   # @books.order(title: :desc)
  #   @sorted_books = @books.sort_by.map {|book|
  #     book.title}
  #
  #   @albums = Work.all.select {|work| work.category == "album"}
  # end
end
