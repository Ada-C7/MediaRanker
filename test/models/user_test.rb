require "test_helper"

describe User do

  describe "validations" do #success case
    it "Can be created with all attributes" do
      User.create!(name: "Anna")
    end


    it "Requires a name" do #failure case test
      a_user = User.new
      result = a_user.valid?
      result.must_equal false
    end
  end


end # END describe Work
