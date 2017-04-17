require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "Cannot create a work without a Title" do
    work.valid?.must_equal false
    work.errors.must_include :title
  end

  it "Can create a Work" do
    work.title = "My Book"
    work.valid?.must_equal true
  end

  it "Title must be unique" do
    work.title = "My Book"
    work.save

    other_work = Work.new
    other_work.title = "My Book"

    other_work.save
    other_work.errors.messages.must_include :title
  end

  it "Publisher year cannot be 0" do
    work.title = "My Book"
    work.pub_yr = 0
    work.valid?.must_equal false
    work.errors.messages.must_include :pub_yr
  end

  it "Publisher year cannot be in the future" do
    work.title = "My Book"
    work.pub_yr = 2018
    work.valid?.must_equal false
    work.errors.messages.must_include :pub_yr
  end

  it "Can create book with valid year" do
    work.title = "My Book"
    work.pub_yr = 2017
    work.valid?.must_equal true
  end

  describe "Work.top_work" do
    it "returns a work object" do
      top_work = Work.top_work
      top_work.must_be_instance_of Work
    end

    it "returns a work with the most votes" do
      top_work = Work.top_work
      top_work.must_equal (works(:work_one))
    end

    #probably should write a method to test how it handles a tie... not sure how to replicate that.

    it "should return nil if there are no works" do
      Work.destroy_all
      Work.top_work.must_be_nil
    end
  end
end
