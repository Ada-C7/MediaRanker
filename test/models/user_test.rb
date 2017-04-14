require "test_helper"

describe User do

  it "doesn't create a user without a user name" do
    value(User.new).wont_be :valid?
  end

  it "creates a valid user given a user name" do
    users = users(:alixhami)

    value(users).must_be :valid?
  end

  it "must have a unique username" do
    user = users(:alixhami)
    user.save.must_equal true

    duplicate_user = User.new(username: user.username)

    duplicate_user.save.must_equal false
    duplicate_user.errors.messages[:username].must_equal ["has already been taken"]
  end
end
