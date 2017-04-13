require "test_helper"

describe Work do
  let(:work) { works(:antonia) }

  #what is this actually doing??
  it "must be valid" do
    work.valid?.must_equal true
    # value(work).must_be :valid?
  end

  # this isn't working
  it "must include valid category" do
    #   validates_inclusion_of :category, in: %w(book, movie, album)
      @valid_categories = ["book", "movie", "album"]
      validates :category, :inclusion => {:in => @valid_categories}
  end

  # it "returns something if doesn't include a valid category" do
  #     #set up a fixture with a bad category and have this test pass
  # end
end
