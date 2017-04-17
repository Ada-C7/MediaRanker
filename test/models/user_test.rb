require "test_helper"

describe User do
  describe "relations" do
    before { @new_vote = Vote.create!(user: users(:user1), work: works(:coexist)) }

    it "adds a new vote that belongs to it to its 'votes' collection" do
      users(:user1).votes.must_include @new_vote
    end

    it "adds a new work to its 'works' collection through votes" do
      users(:user1).works.must_include works(:coexist)
    end
  end

  describe "validations" do
    it "can be created with all attributes" do
      User.create!(username: 'test name')
    end

    it "requires a username" do
      user = User.new
      result = user.valid?
      result.must_equal false

      user.errors.messages.must_include :username
    end
  end
end
