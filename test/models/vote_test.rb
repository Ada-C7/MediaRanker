require "test_helper"

describe Vote do
  describe "test the presence of the ids for the vote to validate" do
    it "is invalid without a user_id or a work_id" do
      vote = Vote.new
      result = vote.valid?
      result.must_equal false
    end
    it "is invalid without a user_id" do
      work_id = Work.first.id
      vote = Vote.new(work_id: work_id)
      result = vote.valid?
      result.must_equal false
    end
    it "is invalid without a work_id" do
      user_id = User.first.id
      vote = Vote.new(user_id: user_id)
      result = vote.valid?
      result.must_equal false
    end
    it "is valid with both a user_id and a work_id" do
      user_id = User.first.id
      work_id = Work.first.id
      vote = Vote.new(user_id: user_id, work_id: work_id)
      result = vote.valid?
      result.must_equal true
    end
  end
  describe "test the uniquness of user_id" do
    it "rejects a duplicate user_id from voting" do
      user_id = User.first.id
      work_id = Work.first.id

      vote_one = Vote.create(user_id: user_id, work_id: work_id)
      vote_two = Vote.create(user_id: user_id, work_id: work_id)

      result = vote_two.valid?
      result.must_equal false
    end
  end
  describe "one test for the relationship" do
    it "can have users and works" do
      user = User.first
      work = Work.first
      test_vote = Vote.create(user_id: user.id, work_id: work.id)

      test_vote.user.must_equal user
      test_vote.work.must_equal work
    end
  end
end
