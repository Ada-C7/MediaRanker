require "test_helper"

describe User do
  let(:user) { User.new }

  it "can create a valid user" do
    user.username = "User1"
    user.must_be :valid?
  end

  it "users require a username" do
    user.valid?
    user.errors.messages.must_include :username
  end

  it "can't create user with a blank username" do
    user.username = ""
    user.valid?
    user.errors.messages.must_include :username
  end

  it "user's username must be unique" do
    user.username = "cool name"
    user.save
    new_user = User.new
    new_user.username = "cool name"

    new_user.valid?
    new_user.errors.messages.must_include :username
  end

  it "a user has_many votes" do
    user1_votes = users(:user1).votes

    user1_votes.first.class.must_equal Vote
    user1_votes.last.class.must_equal Vote
  end

  it "user1 has correct number of votes" do
    users(:user1).votes.count.must_equal 3
  end

  it "a user with no votes returns an empty array" do
    users(:user5).votes.must_equal []
  end
end
