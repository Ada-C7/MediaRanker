require "test_helper"

describe User do
  let(:user) { User.new }

  it "Cannot create a User without a name" do
    user.valid?.must_equal false
    #negative test

    user.errors.messages.must_include :name
    #negative test
  end


  it "Can create a user with a name" do
    user.name = "sue"
    user.valid?.must_equal true #won't run validations until save or valid? is run
    # user.errors.messages[:name].must_equal []
  end

  it "Name must be unique" do

    user.name = "Joe"
    user.save
    user2 = User.new
    user2.name = "Joe"
    user2.valid?.must_equal false
    # user2.errors.messages.must_include :isbn
    user2.errors.messages[:name].must_equal ["has already been taken"]
  end
end
