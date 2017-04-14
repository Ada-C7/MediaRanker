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
      user = User.create(name: "ken")
      work = works(:lee)
      vote = Vote.create(user_id: user.id, work_id: work.id)
      work_two = works(:mee)
      vote_two= Vote.create(user_id: user.id, work_id: work_two.id)

      user.votes[0].class.must_equal Vote
      user.votes.size.must_equal 2
    end
  end

end
