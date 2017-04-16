require "test_helper"

describe Vote do
  let(:vote) { Vote.new }
  let(:user) { users(:betty) }
  let(:movie) { works(:anything) }
  let(:book) { works(:elemental) }
  let(:bettyvote) {votes(:betty_bookvote)}

  it "cannot create a vote without a work_id and a user_id" do
    vote.save
    vote.valid?.must_equal false
  end

  it "can create a vote with both a work_id and a user_id" do
    vote.user = user
    vote.work = movie
    vote.save
    vote.valid?.must_equal true
  end

  it "cannot create a second vote from the same user for the same work" do
    vote.user = user
    vote.work = book
    vote.save
    vote.valid?.must_equal false
  end
end
