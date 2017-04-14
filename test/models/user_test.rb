require "test_helper"

describe User do
  let(:user) { User.new(username: "jill") }

  it "must be valid" do
    value(user).must_be :valid?
  end

  # 
  # describe "all_votes" do
  #   it "returns all of a users votes" do
  #   a = User.first
  #   b = a.all_votes(a.id)
  #   print b
  #
  #   b.must_be_kind_of Hash
  #   print b.length
  #   end
  # end

end
