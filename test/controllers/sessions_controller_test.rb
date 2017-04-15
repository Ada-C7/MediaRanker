require "test_helper"

describe SessionsController do
  def sign_in
    post login_path, params: { username: "New User" }
  end
  
  it "login page loads" do
    get login_path
    must_respond_with :success
  end

  it "should redirect home after logging in" do
    sign_in
    must_redirect_to root_path
  end

  it "should affect the model when new user is created" do
    proc { sign_in }.must_change 'User.count', 1
  end

  it "doesn't affect the model when same user logs in" do
    sign_in
    proc {
      post login_path, params: { username: "New User" }
    }.must_change 'User.count', 0
  end

  it "can login" do
    sign_in
    session[:user_id].wont_equal nil
  end

  it "can logout" do
    sign_in
    delete logout_path
    session[:user_id].must_equal nil
  end

  #ATTEMPT REDIRECT BACK TESTS WHEN I HAVE TIME
end
