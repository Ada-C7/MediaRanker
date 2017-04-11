require "test_helper"

describe Content do
  let(:content) { Content.new }

  it "you can create new Content" do
    content.category = "book"
    content.title = "Test Book"
    content.creator = "Me"
    content.publication_year = "2009"
    content.description = "This be test"

    content.valid?.must_equal true
  end

  it "category must be valid" do
    contents(:invalid_category).valid?.must_equal false
  end

  it "must have a title on creation" do
    contents(:no_title).valid?.must_equal false
  end

  it "must have a creator on creation" do
    contents(:no_creator).valid?.must_equal false
  end

  it "must have a publication_year on creation" do
    contents(:no_year).valid?.must_equal false
  end

end
