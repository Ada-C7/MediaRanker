require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    votes(:valid_vote).valid?.must_equal true
  end

  it "must not allow users to vote on the same content multiple times" do
    votes(:invalid_vote).valid?.must_equal false
  end
end
