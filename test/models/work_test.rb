require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "must have a title" do
    work.valid?.must_equal false
  end

  it "will work with a title" do
    work.title = works(:amelie).title
    work.valid?
    work.errors.messages.wont_include :title
  end

  it "must have a category" do
    work.valid?.must_equal false
  end

  it "must have a valid category" do
    work.category = "poem"
    work.valid?
    work.errors.messages.must_include :category
  end

  it "valid categories are album, movie, or book" do
    work.category = works(:amelie).category
    work.valid?
    work.errors.messages.wont_include :category
  end

end
