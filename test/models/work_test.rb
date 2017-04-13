require "test_helper"

describe "Work" do

  describe "self.by_category" do
    it "should return a collection of albums if ablum is entered" do
      work = Work.where(title: "album title").first
      Work.by_category("album").must_equal([work])
    end

    it "should return books if books is entered" do
      work = Work.where(title: "Book Title").first
      Work.by_category("book").must_equal([work])
    end

    it "should return movies if movies is entered" do
      work = Work.where(title: "Movie title").first
      Work.by_category("movie").must_equal([work])
    end

    it "should return an empty array if it's an invalid category" do
      Work.by_category("bad category").must_equal([])
      Work.by_category("").must_equal([])
      Work.by_category(nil).must_equal([])
    end

  end

end
