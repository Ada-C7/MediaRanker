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
end
