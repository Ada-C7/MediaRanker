require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "must be valid" do
    votes(:voteone).must_be :valid?
  end

  it "require user_id" do
    vote.valid?
    vote.errors.messages.must_include :user
  end

  it "require work_id" do
    vote.valid?
    vote.errors.messages.must_include :work
  end






end
