require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "Cannot create a vote without a work" do
    vote.valid?.must_equal false
    vote.errors.must_include :work
  end

  it "Cannot create a vote without a user" do
    vote.valid?.must_equal false
    vote.errors.must_include :user
  end

  it "Can create a new vote" do
    vote.user_id = (users(:lynn).id)
    vote.work_id = (works(:work_one).id)

    vote.valid?.must_equal true
  end

  describe "Vote.unique?" do
    it "returns false if vote has already been made" do
      Vote.unique?(users(:lynn).id, works(:work_one).id).must_equal false
    end

    it "returns true if vote has not been made" do
      Vote.unique?(users(:lynn).id, works(:no_votes_work).id).must_equal true
    end
  end

end
