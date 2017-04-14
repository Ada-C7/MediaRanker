require "test_helper"

describe User do
  describe "validations" do
    it "is invalid without a username" do
      user = User.new
      result = user.valid?
      result.must_equal false

      user.errors.messages.must_include :username
    end

    it "successfully creates a user" do
      user = User.new(username: "Test")
      result = user.valid?
      result.must_equal true
    end
  end

  describe "associations" do
    #### VOTE COUNT IS VALIDATED MANUALLY -- HOW TO MAKE IT AUTO
    it "can access votes" do
      vote_count = 2
      user = users(:one)
      user.votes.count.must_equal 2
    end
    #### VOTE COUNT IS VALIDATED MANUALLY -- HOW TO MAKE IT AUTO
    it "can access works" do
      work_count = 2
      user = users(:one)
      user.works.count.must_equal 2
    end
  end
end
