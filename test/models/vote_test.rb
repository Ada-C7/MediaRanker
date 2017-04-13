require "test_helper"

describe Vote do
  let(:vote) { Vote.new }

  it "can create a vote" do
    vote.user = User.create(username: "Yay")
    vote.work = Work.create(title: "A Movie", category: "movie")
    vote.must_be :valid?
  end

  it "a vote is required to have a user" do
    vote.valid?
    vote.errors.messages.must_include :user
  end

  it "a vote is required to have a work" do
    vote.valid?
    vote.errors.messages.must_include :work
  end

  it "a vote belongs to a user" do
    vote.user = User.create(username: "Yay")
    vote.user.class.must_equal User
  end

  it "a vote belongs to a work" do
    vote.work = Work.create(title: "A Book", category: "book")
    vote.work.class.must_equal Work
  end
end
