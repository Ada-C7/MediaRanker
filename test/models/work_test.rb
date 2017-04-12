require "test_helper"

describe Work do

  describe "validations" do
    it "can create an instance of work with all attributes" do
      work = Work.new(title: "fake title", creator: "fake creator", publication_year: 2000, description: "this is a fake description", category: "movie")
      result = work.valid?
      result.must_equal true
    end
    it "requires a title" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end
    it "requires category only include: book, album, or movie" do
      work = Work.new(title: "fake title", creator: "fake creator", publication_year: 2000, description: "this is a fake description", category: "chair")
      result = work.valid?
      result.must_equal false
    end
  end
  describe "relationships" do
    
  end

end
