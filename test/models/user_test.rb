require "test_helper"

describe User do
  let(:user) { User.new }

  it "Users must have names" do
    user.valid?.must_equal false
    #hash of all message
    user.errors.messages.must_include :name
  end

  it "If a name is given, user is valid" do
    user.name = "Name"
    user.valid?.must_equal true

    user.errors.messages[:name].must_equal []
  end

  it "you can create a user" do
    user.name = "Name"

    user.valid?.must_equal true
  end

  it "Names must be unique" do
    user1 = User.new
    user1.name = "Jackie"
    user1.save

    user2 = User.new
    user2.name = "Jackie"

    user2.valid?.must_equal false
    user2.errors.messages[:name].must_equal ["has already been taken"]
  end
end
