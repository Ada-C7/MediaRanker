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

end
