require "test_helper"

describe UsersController do

  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should show one user" do
    get user_path(users(:jackie).id)
    must_respond_with :success
  end

end
