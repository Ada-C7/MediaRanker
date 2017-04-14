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


  # Testing model relationship
  describe "relation/has_many votes" do

    it "Responds to votes method" do
      vote1 = Vote.create( work_id: works(:movie1).id, user_id: users(:anderson).id)

      works(:movie1).must_respond_to :votes
    end
    #
    it "Can retrieve votes list " do
      works(:movie1).votes.must_include votes(:voteone)
    end
  end

end
# vote1.must_respond_to :user
# user_id: users(:anderson).id)

# binding.pry
