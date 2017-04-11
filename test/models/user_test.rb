require "test_helper"

describe User do
  let(:user) { User.new }

  # must have a username
  it "cannot create a user without a username" do
    user.valid?.must_equal false
  end
  # username must be unique

  it "username must be unique" do
    user = users(:aurora)
    user.valid?.must_equal true
    user2 = User.new(username: "auroraanderson")
    user2.save.must_equal false
  end

  # can create a new user
  it "can create a new user" do
    user = User.new(username: "pinky")
    user.save.must_equal true
  end


end
