require "test_helper"

describe Work do
  let(:work) {Work.new }

  #what is this actually doing??
  it "must be valid" do
    #   my_work = works(:antonia)
    #   my_work.valid?
    #   my_work.must_be :valid?
      works(:antonia).must_be :valid?
  end

  # this isn't working
  # it "must include valid category" do
  #   #   validates_inclusion_of :category, in: %w(book, movie, album)
  #     @valid_categories = ["book", "movie", "album"]
  #     validates :category, :inclusion => {:in => @valid_categories}
  # end

  # it "returns something if doesn't include a valid category" do
  #     #set up a fixture with a bad category and have this test pass
  # end
end
