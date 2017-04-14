require "test_helper"

describe Vote do
  describe "validations" do
    it "is invalid without a user" do
      work = Work.first
      vote = Vote.new(work: work)
      result = vote.valid?
      result.must_equal false

      vote.errors.messages.must_include :user
    end

    it "is invalid without a work object" do
      user = User.first
      vote = Vote.new(user: user)
      result = vote.valid?
      result.must_equal false

      vote.errors.messages.must_include :work
    end

    it "successfully creates a vote" do
      work_id = Work.first.id
      user_id = User.first.id
      vote = Vote.new(user_id: user_id, work_id: work_id)
      result = vote.valid?
      result.must_equal true
    end

    it "will not record duplicates of the same user_id/work_id" do
      work_data = Work.last
      user_data = User.last
      vote1 = Vote.new(user: user_data, work: work_data)
      vote2 = Vote.new(user: user_data, work: work_data)
      result = vote2.valid?
      result.must_equal false
    end
  end

  ####################################################

  #### TW: Doesn't this just check my fixture set-up and not my model?

  describe "associations" do
    it "contains the correct user object" do
      vote = votes(:three)
      user_one = users(:one)
      vote.user.must_equal user_one
    end

    it "contains the correct work object" do
      vote = votes(:three)
      book = works(:book)
      vote.work.must_equal book
    end
  end
  ####################################################
end
