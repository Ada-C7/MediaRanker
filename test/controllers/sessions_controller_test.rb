require "test_helper"

describe SessionsController do
  it "gets a login form" do
    get login_path
    must_respond_with :success
  end

  it "should redirect to index after logging an existing user in" do
    post login_path, params: {name: "Lynn"}
    must_redirect_to root_path
  end

  it "if user exists, should not affect model" do
    proc {
      post login_path, params: {name: "Lynn"}
    }.must_change 'User.count', 0
  end

  it "if user does not exist, should create new user" do
    proc {
      post login_path, params: {name: "Louise"}
    }.must_change 'User.count', 1
  end

  it "should redirect_to users path if new user created" do
    post login_path, params: {name: "Louise"}
    must_redirect_to users_path
  end
end
