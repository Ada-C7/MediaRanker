require "test_helper"
require "pry"

# Testing Validations
describe Work do
  let(:work1) { Work.new }

  it "Work must be valid" do
    work1.title = "My Life"

    work1.must_be :valid?
  end

  it "Can't create a medium without a title" do
    work1.valid?.must_equal false

    work1.errors.messages.must_include :title
  end

  it "Can craete a medium/movie" do

    works(:movie1).valid?.must_equal true
  end

  it "If a title is given the movie is valid" do
    work1.title = "Neemo"
    work1.errors.messages[:title].must_equal []
  end
end

# Testing model relationship
describe "relation/has_many votes" do

  let(:work1) {Work.new}

  vote1 = Vote.create!(work_id: 2, user_id:4)

  binding.pry

  it "Can retrieve votes through a medium" do
    work1.work_id.must_equal 2

  end


end
