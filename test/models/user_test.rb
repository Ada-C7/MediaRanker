require "test_helper"

describe User do
  describe "validations" do
    it "is invalid without a name" do
      user = User.new
      user.valid?.must_equal false
      user.errors.messages.must_include :name
    end

    it "is valid with a name" do
      users(:user).valid?.must_equal true
    end
  end

  describe "Entity Relationship" do
    it "can access Vote objects" do
      vote = votes(:one)
      vote.user.must_equal users(:user)
    end
  end


end
