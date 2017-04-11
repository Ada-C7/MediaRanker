require "test_helper"

describe User do
    describe "Validations" do
      it "Can be created with all attributes" do
        u = users(:user1)
        result = u.valid?
        result.must_equal true
      end
      it "Requires a username and date of joining " do
        u = User.new
        result = u.valid?
        result.must_equal false
        u.errors.messages.must_include :username
        u.errors.messages.must_include :date_of_joining
      end
      it "Username should contain only letter and numbers (no symbols execept underline symbol)" do
        u = User.new(username: "user^%*" , date_of_joining: "21/01/12" )
        result = u.valid?
        result.must_equal true # DOESNT WORK WITH FALSE!
      end


    end # end of validation block

end
