require "test_helper"

describe Work do
  describe 'validations' do
    it "is invalid without a title" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end
  end

  describe 'self.books' do
    it "returns all books in the database" do
      Work.books.count.must_equal 4
    end

    it "returns only books" do
      Work.books.each do |book|
        book.category.must_equal "book"
      end
    end
  end
############################
describe 'self.movies' do
  it "returns all movies in the database" do
    Work.movies.count.must_equal 3
  end

  it "returns only movies" do
    Work.movies.each do |movie|
      movie.category.must_equal "movie"
    end
  end
end
############################
describe 'self.albums' do
  it "returns all albums in the database" do
    Work.albums.count.must_equal 4
  end

  it "returns only albums" do
    Work.albums.each do |album|
      album.category.must_equal "album"
    end
  end
end
############################


  describe 'self.spotlight' do
    it "selects the work by maximum votes counts" do
      Work.spotlight.must_equal works(:three)

    end
  end
end
