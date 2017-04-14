require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should get show page" do
    get user_path(users(:one).id)
    must_respond_with :success
  end

  it "should show a 404 when user not found" do
    skip
    get user_path(3)
    must_respond_with :missing
  end
end
