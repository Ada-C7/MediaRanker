require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    votes(:valid_vote).valid?.must_equal true
  end
end
