require 'test_helper'

class UserTest < ActiveSupport::TestCase

  describe User do
    let(:user) { user.new }

    it "Cannot create a user without a name" do
      user.valid?.must_equal false
    end

    it "Can create a user with a name" do
      user = User.new
      user.name = "Clement Herd"
      user.save
      user.name = user
      user.valid?.must_equal true
    end
  end

end
