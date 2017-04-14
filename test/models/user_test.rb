require "test_helper"

describe User do
  let(:user) { User.new }

  it "must have a username" do
    user.username = "testname"
    user.valid?.must_equal true
  end

  it "should be able to associate with a Vote object" do
    proc {
    users(:user).votes.create
    }.must_change 'users(:user).votes.length', 1
  end
end
