require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should show individual user" do
    user = User.create(username: "New User")
    get user_path(user.id)
    must_respond_with :success
  end

  it "should redirect to 404 if given bad user id" do
    get user_path(1)
    must_respond_with :missing
  end
end
