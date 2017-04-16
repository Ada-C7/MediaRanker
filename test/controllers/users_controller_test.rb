require "test_helper"

describe UsersController do
  let(:user) { users(:betty) }

  it "should get index" do
    get users_path
    must_respond_with :success
  end

  it "should get show" do
    get user_path(user.id)
    must_respond_with :success
  end

  it "should render 404 if user id not found" do
    get user_path(600)
    must_respond_with :missing
  end

end
