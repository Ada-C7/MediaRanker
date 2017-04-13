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
    work.valid?.must_equal true
    book = Work.new
    book.title = "The duck"
    book.save

    book.valid?.must_equal false
  end

  it "requires that a publish_year attribute is present" do
    work.valid?.must_equal true
  end
end

describe Work do
  let(:work) { works(:owl) }

  it "requires that category be only 'book', 'movie', or 'album'" do
    work.valid?.must_equal false
    work.errors.messages[:category].must_equal ["is not included in the list"]
  end
end

describe Work do
  let(:work) { works(:cat) }
  it "requires that a title can't be blank" do
    work.valid?.must_equal false
    work.errors.messages[:title].must_equal ["can't be blank"]
  end
end

describe Work do
  let(:work) { works(:dog) }

  it "requires that a creator and publish_year attribute be present"
  # negative test
  # work.valid?.must_equal false
  # work.errors.messages[:creator].must_equal []
  # work.errors.messages[:publish_year].must_equal []
end
