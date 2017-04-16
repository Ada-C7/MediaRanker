require "test_helper"

describe Vote do
  describe "validations" do
    it "is valid with a user and a work" do
      votes(:one).valid?.must_equal true
    end

    it "is invalid without a user" do
      vote = votes(:three)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :user
    end

    it "is invlaid without a work" do
      vote = votes(:two)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :work
    end
  end

  describe "Entity Relationship" do
    it "can access User objects" do
      vote = votes(:one)
      users(:user).must_equal vote.user
      works(:lee).must_equal vote.work
    end
  end

end
