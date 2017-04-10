require "test_helper"

describe Work do
  describe "validations" do
    it "is invalid without a title or a category" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end

    it "is invalid without just a category" do
        work = Work.new(title: "Things")
        result = work.valid?
        result.must_equal false
    end

    it "is invalid without just a title" do
      work = Work.new(category: "album")
      result = work.valid?
      result.must_equal false
    end

    it "is valid with a title and a category" do
      work = Work.new(title: "stuff", category: "album")
      result = work.valid?
      result.must_equal true
    end

    it "is invalid with an unincluded category" do
      work = Work.new(title: "stuff", category: "stuff")
      result = work.valid?
      result.must_equal false
    end
  end
end
