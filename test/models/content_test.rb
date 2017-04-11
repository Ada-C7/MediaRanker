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
end
