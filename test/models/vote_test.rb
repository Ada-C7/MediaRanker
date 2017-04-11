require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  # must have user id
  it "must have user id" do
    vote = votes(:one)
    vote.user = nil
    vote.save.must_equal false
    vote.user = users(:aurora)
    vote.save.must_equal true
  end

  # must have work id
  it "must have work id" do
    vote = votes(:one)
    vote.work = nil
    vote.save.must_equal false
    vote.work = works(:fall)
    vote.save.must_equal true
  end

  # can create a new vote
  it "can create a new vote" do
    vote = Vote.new(work: works(:fall), user: users(:aurora))
    vote.save.must_equal true
  end

end
