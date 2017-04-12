require "test_helper"

describe Work do
  describe "validations" do
    it "is invalid without a title" do
      work = Work.new
      result = work.valid?
      result.must_equal false

      work.errors.messages.must_include :title
    end

    it "is invalid without a category" do
      work = Work.new
      result = work.valid?
      result.must_equal false

      work.errors.messages.must_include :category
    end

    it "is invalid without a creator" do
      work = Work.new
      result = work.valid?
      result.must_equal false

      work.errors.messages.must_include :creator
    end

####################################################

    # Not sure about these series of tests

    it "creates work with title" do
      work = Work.create(title: "More Life")
      work.errors.messages.wont_include :title
    end

    it "creates work with category" do
      work = Work.create(category: "album")
      work.errors.messages.wont_include :category
    end

    it "creates work with creator" do
      work = Work.create(creator: "Drake")
      work.errors.messages.wont_include :creator
    end
####################################################

    it "creates work with all fields" do
      work = Work.create(title: "More Life", creator: "Drake", category: "album")
      work.id.wont_be_nil
    end
  end

####################################################

    # Not sure about whether this needs testing (or how to test has_manys)

  describe "relationship" do
    it "should have many votes" do
    end
  end
####################################################
end
