require "test_helper"

describe User do

     let(:user) { User.new }

     it "Able to create a user" do
          user = User.new
          user.must_be_kind_of User
     end

end
