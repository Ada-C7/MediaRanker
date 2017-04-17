require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "should be created with user and work ids" do
    vote = votes(:my_vote)
    vote.valid?.must_equal true
  end

  it "should not be created with no user id" do
    vote = votes(:my_vote_no_user_id)
    vote.valid?.must_equal false
  end

end
