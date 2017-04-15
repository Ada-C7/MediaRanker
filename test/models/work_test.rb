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
      Work.books.count.must_equal 3
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
    binding.pry
    Work.movies.count.must_equal 3
  end

  it "returns only movies" do
    Work.books.each do |book|
      book.category.must_equal "book"
    end
  end
end
############################
describe 'self.books' do
  it "returns all books in the database" do
    Work.books.count.must_equal 3
  end

  it "returns only books" do
    Work.books.each do |book|
      book.category.must_equal "book"
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
