require "test_helper"

describe User do
  describe "validations" do
      it "is invalid without a name" do
        user = User.new
        result = user.valid?
        result.must_equal false
      end

      it "is valid with a name" do
        user = User.new(name: "Fred")
        result = user.valid?
        result.must_equal true
      end
  end

  describe "relations" do
    it "can have votes" do

    end

    it "can call up a list of those votes" do

    end

  end
end
