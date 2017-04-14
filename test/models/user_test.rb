require "test_helper"

describe User do
  let(:user) { User.new(username: "jill") }

  it "must be valid" do
    value(user).must_be :valid?
  end


  describe "all_votes" do
    a = self.all_votes
    a.class.must_be Hash
  end
end
