require "test_helper"

describe User do
  describe "validations" do
      it "is invalid without a name" do
        user = User.new
        result = user.valid?
        result.must_equal false
      end

      it "is valid with a name" do
        user = User.new(name: "Fred")
        result = user.valid?
        result.must_equal true
      end

      it "is valid with a unique name" do
        user = User.new(name: "Purple Potato Car")
        result = user.valid?
        result.must_equal true
      end

      it "is invalid without a unique name" do
        user_one = User.new(name: "Fred")
        user_two = User.new(name: "Fred")
        result = user_two.valid?
        result.must_equal false
    end
  end

  describe "relations" do
    it "contains a vote collection" do
      user = User.first
      work = Work.first
      test_vote = Vote.create(user_id: user.id, work_id: work.id)

      user.votes.must_include test_vote
    end

    it "can call a work through the vote" do
      user = User.first
      work = Work.first
      test_vote = Vote.create(user_id: user.id, work_id: work.id)

      user.works.must_include work
    end
  end
end
