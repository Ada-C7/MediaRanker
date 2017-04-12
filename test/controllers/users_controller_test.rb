require "test_helper"

describe UsersController do
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  #pos show test
  it "should get show page" do
    get user_path(users(:lynn).id)
    must_respond_with :success
  end

  #neg show test
  it "should show a 404 if work not found" do
    get user_path(1)
    must_respond_with :missing
  end
end
