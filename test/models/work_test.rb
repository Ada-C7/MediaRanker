require "test_helper"

describe Work do
  let(:work1) { Work.new }

# Testing Validations
  it "Work must be valid" do
    # album1.category = "album"
    work1.title = "My Life"

    work1.must_be :valid?
  end

  it "Work requires a title" do
    work1.valid?.must_equal false

    work1.errors.messages.must_include :title
  end

  it "Can craete a medium/movie" do

    works(:movie1).valid?.must_equal true
  end


  it "If a title is given the movie is valid" do
    work1.title = "Neemo"
    work1.valid?

    work1.errors.messages[:title].must_equal []
  end




end
