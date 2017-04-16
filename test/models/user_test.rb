require "test_helper"

describe User do
  let(:user) { users(:bren, :ella, :bob).sample }

  # 2+ tests for each validation on a model
  describe "validations" do
    # name - positive
    it "Users are valid with name" do
      user.valid?
      user.errors.messages[:name].must_equal []
    end

    # name - negative
    it "Users are invalid without name" do
      user = User.create(name: nil)
      user.valid?.must_equal false
      user.errors.messages.must_include :name
    end
  end

  # 1+ test for each model relationship
  describe "relationships" do
    it "returns an array of votes" do
      user.votes.each do |vote|
        vote.must_be_instance_of Vote
        vote.user.must_equal user
      end
    end

    # does not pass but works on website, error in test syntax?
    it "returns an empty array of votes when user deleted" do
      deleted_user = users(:bob)
      deleted_user_votes = deleted_user.votes
      deleted_user.destroy
      deleted_user_votes.must_be_empty
    end

  end
end
