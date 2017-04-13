require "test_helper"

describe SessionsController do
  it "login page loads" do
    get login_path
    must_respond_with :success
  end

  it "should redirect home after logging in" do
    post login_path, params: { username: "New User" }
    must_redirect_to root_path
  end

  it "should affect the model when new user is created" do
    proc {
      post login_path, params: { username: "New User" }
    }.must_change 'User.count', 1
  end

  it "doesn't affect the model when same user logs in" do
    post login_path, params: { username: "New User" }
    proc {
      post login_path, params: { username: "New User" }
    }.must_change 'User.count', 0
  end

  #ATTEMPT REDIRECT BACK TESTS WHEN I HAVE TIME
end
