require "test_helper"

describe User do
  let(:user) { User.new }
  let(:fred) { users(:fred) }
  let(:fred_bookvote) { votes(:fred_bookvote)}

  it "can't create a user without a name" do
    user.valid?.must_equal false
    user.errors.messages.must_include :name
  end

  it "can create a user with a unique name" do
    user.name = "Banana Banana"
    user.valid?.must_equal true
    user.errors.messages[:name].must_equal []
  end

  it "can't create a user with a duplicate name" do
    user.name = "Fred Flinstone"
    user.valid?.must_equal false
    user.errors.messages.must_include :name
  end

  it "can find the user's vote through 'votes'" do
    fred.votes.first.must_equal fred_bookvote
  end
end
