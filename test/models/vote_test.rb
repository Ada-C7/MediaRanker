require "test_helper"

describe Vote do
  let(:vote) { votes(:vote_bnb, :vote_obvchild, :vote_soviet, :vote_uproot).sample }

  # 2+ tests for each validation on a model
  describe "validations" do
    # work_id - positive
    it "Votes are valid with work" do
      vote.valid?
      vote.errors.messages[:work].must_equal []
    end

    # work_id - negative
    it "Votes are invalid without work" do
      vote = Vote.create(work: nil)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :work
    end

    # user_id - positive
    it "Votes are valid with user" do
      vote.valid?
      vote.errors.messages[:user].must_equal []
    end

    # user_id - negative
    it "Votes are invalid without user" do
      vote = Vote.create(user: nil)
      vote.valid?.must_equal false
      vote.errors.messages.must_include :user
    end

    # how to test for scope?
  end

  # 1+ test for each model relationship
  describe "relationships" do
    it "returns a work" do
      vote.work.must_be_instance_of Work
    end

    it "returns a user" do
      vote.user.must_be_instance_of User
    end

    it "work and user still exist once vote deleted" do
      deleted_vote = votes(:vote_obvchild)
      deleted_vote_user = deleted_vote.user
      deleted_vote_work = deleted_vote.work
      deleted_vote.destroy
      deleted_vote_user.must_equal deleted_vote_user
      deleted_vote_work.must_equal deleted_vote_work
    end
  end

end
