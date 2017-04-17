require "test_helper"

describe SessionsController do
  it "should get login page" do
    get login_path
    must_respond_with :success
  end

  it "should recognize existing users at login" do
    user = users(:user)
    post login_path(name:user.name)
    must_respond_with :redirect
    must_redirect_to root_path
  end

  it "should recognize new users at login" do
    post login_path(name:"ginny")
    must_respond_with :redirect
    must_redirect_to root_path
  end

  it "should render login form for invalid name" do
    post login_path(name:"")
    must_respond_with :success
  end

  it "cannot allow blank user name at login" do
    proc {
      post login_path("")
    }.must_change 'User.count', 0
  end

  it "should allow user to logout" do
    delete logout_path
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to root_path
  end
end
