require "test_helper"

describe SessionController do
  it "retrieves the login page" do
    get login_path
    must_respond_with :success
  end

  it "allows an existing user to login" do
    post create_login_path(users(:user).username)
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to root_path

  end
end
