require "test_helper"

describe UsersController do
  it "Responds" do
    User.count.must_be :>, 0
    get users_path
    must_respond_with :success
  end
end
