require "test_helper"

describe Work do
  let(:work) { works(:duck) }

  it "requires a title" do
    # work = works(:owl)
    work.valid?.must_equal true
  end

  it "requires a creator" do
    work.valid?.must_equal true
  end

  it "requires a unique title" do

  end

  it "requires that category be only 'book', 'movie', or 'album'" do

  end

  it "requires that a publish_year attribute is present" do

  end
end
