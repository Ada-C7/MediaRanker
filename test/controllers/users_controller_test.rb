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

  it "Show Works: shows a user based on if" do
    user = User.first
    get user_path(user)
    must_respond_with :success
  end

  it "Show Works: return a 404 if the user doesn't exist" do
    user_id = User.last.id
    user_id += 1
    get user_path(user_id)

    must_respond_with :not_found
  end
end
