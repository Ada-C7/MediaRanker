class Work < ApplicationRecord
  has_many :votes
  validates :title, presence: true, uniqueness: true

  validates :category, presence: true

  validates :publication_year, numericality: { only_integer: true}


  def self.category_sorted(category)
    return where(category: category).order(votes_count: :desc)
  end

  def self.top_ten(category)
    return category_sorted(category).limit(10)
  end

  def self.spotlight
    return all.order(votes_count: :desc).first
  end


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
