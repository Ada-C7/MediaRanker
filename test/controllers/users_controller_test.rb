require "test_helper"

describe UsersController do
  let(:user) { user(:my_user) }

  it "should get show" do
    get users_path
    must_respond_with :success
  end

  it "should show 404 when work not found" do
    get user_path(4000)
    must_respond_with :missing
  end
end
