require "test_helper"

describe User do
  describe "validations" do
    it "is invalid without a username" do
      user = User.new
      result = user.valid?
      result.must_equal false

      user.errors.messages.must_include :username
    end

    it "creates user with username populated" do
      user = User.create(username: "Ting")
      user.id.wont_be_nil
    end
  end

  ####################################################

  # Not sure about whether this needs testing (or how to test has_manys)

  describe "relationship" do
    it "should have many votes" do
    end
  end
  ####################################################
end
