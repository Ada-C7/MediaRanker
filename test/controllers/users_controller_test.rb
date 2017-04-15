require "test_helper"

describe UsersController do
  let(:user) { users(:bren, :ella, :bob).sample }

  # index
  it "should get index" do
    get users_path
    must_respond_with :success
  end

  # show
  # positive
  it "should get show" do
    get user_path(user)
    must_respond_with :success
  end

  # negative
  it "should show 404 when work not found" do
    get user_path(1)
    must_respond_with :missing
  end

end
