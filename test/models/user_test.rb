require "test_helper"

describe User do
  it "Can be created with all attributes" do
   user = User.new(username: "whatever")
   result = user.valid?
   result.must_equal true
  end

  it "is invalid without a username" do
    user = User.new
    result = user.valid?
    result.must_equal false
  end

  it "Must have a unique username" do
    user = User.create!(username: "whatever")
    user1 = User.create(username: "whatever")
    user1.errors.messages.must_include :username
  end
end
