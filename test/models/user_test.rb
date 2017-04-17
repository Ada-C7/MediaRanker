require "test_helper"

describe User do
  let(:user1) { User.new }

  it "must be valid" do
    users(:hallman).must_be :valid?
  end

  it "can retrieve user's attribute" do
    users(:hallman).must_be :valid?
    users(:hallman).name.must_equal "Noura Hallman"
  end

  it "Can't create a user without a name" do
    user1.valid?.must_equal false

    user1.errors.messages.must_include :name
  end

  it "can't create user with empty string" do
    user1.name = ""
    user1.valid?
    user1.errors.messages.must_include :name
  end

  it "username should be unique" do
    user1.name = "Jumanah"
    user1.save
    user_new = User.new
    user_new.name = "Jumanah"

    user_new.valid?
    user_new.errors.messages.must_include :name
  end

  it "User has many votes" do
    votes = users(:anderson).votes
    votes.first.class.must_equal Vote

  end

end
