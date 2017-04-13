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

end
