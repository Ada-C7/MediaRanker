require "test_helper"

describe User do
  let(:user) { User.new }

  it "should be created if there are no duplicate usernames" do
    user = users(:my_user)
    user.valid?.must_equal true
  end

  it "requires a name to create a new user" do
    user = users(:my_user_no_name)
    user.valid?.must_equal false
  end

end
