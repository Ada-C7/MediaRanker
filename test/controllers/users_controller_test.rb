require "test_helper"

describe UsersController do
  it "Responds correctly" do
    User.count.must_be :>, 0
    get users_path
    must_respond_with :success
  end

  it "Responds without any users" do
    User.destroy_all
    get users_path
    must_respond_with :success
  end
end
