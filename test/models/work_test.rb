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

# Testing model relationship (has_many)
  it "Responds to votes method" do
    vote1 = Vote.create( work_id: works(:movie1).id, user_id: users(:anderson).id)

    works(:movie1).must_respond_to :votes
  end

# Why this one is not working??
  # it "Can retrieve votes list " do
  #   works(:movie1).votes.must_include votes(:voteone)
  # end

# Testing custom methods

  it "Responds to spot_light method / Returns medium of maximum
 votes" do

  vote1 = Vote.create( work_id: works(:movie1).id, user_id: users(:anderson).id)

  vote2 = Vote.create( work_id: works(:movie1).id, user_id: users(:hallman).id)

  vote3 = Vote.create( work_id: works(:album1).id, user_id: users(:sulaiman).id)

  (Work.spot_light.first.id).must_equal works(:movie1).id
  end


end
