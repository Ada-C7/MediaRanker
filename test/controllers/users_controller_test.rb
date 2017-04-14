require "test_helper"

describe UsersController do
  describe "index" do
    it "responds successfully" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end
  end
end
