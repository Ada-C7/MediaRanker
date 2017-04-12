require "test_helper"

describe User do
  let(:user) { User.new }

  it "can't create a user without a name" do
    user.valid?.must_equal false
    user.errors.messages.must_include :name
  end

  it "can create a user with a name" do
    user.name = "Banana Banana"
    user.valid?.must_equal true
    user.errors.messages[:name].must_equal []
  end
end

# describe Work do
#   let(:work) { works(:elemental) }
#   let(:work2) { Work.new }
#
#   it "can't create a work without a title" do
#     work2.valid?.must_equal false
#     work2.errors.messages.must_include :title
#   end
