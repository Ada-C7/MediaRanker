require "test_helper"

describe User do
  let(:user) { User.new }

  it "must have a username" do
    user.username = "testname"
    user.valid?.must_equal true
  end
end
