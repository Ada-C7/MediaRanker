require "test_helper"

describe UsersController do
  it "Should get index" do
  get users_path
  must_respond_with :success
 end

 it "Sould get show" do
  get user_path(users(:hallman).id)
  must_respond_with :success
end

it "Should show a 404 when user is not found" do
get user_path(4)
must_respond_with :missing
end




end
