require "test_helper"

describe User do
  let(:user) { User.new }

  it "cannot create a user without a name" do
    user.valid?.must_equal false
    user.errors.must_include :name
  end

  it "can create a user" do
    user.name = "lynn"
    user.valid?.must_equal true
  end

  it "Name must be unique" do
    user.name = "Lynn"
    user.save

    other_user = User.new
    other_user.name = "Lynn"

    other_user.save
    other_user.errors.messages.must_include :name
  end

end
