require "test_helper"

describe UsersController do
  describe "index" do
    it "responds successfully when there are many users" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "responds successfully when there are no users" do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "responds successfully when given a valid id" do
      user_id = User.first
      get user_path(user_id)
      must_respond_with :success
    end

    it "returns 404 not found when given an invalid id" do
      user_id = User.last.id + 1
      get user_path(user_id)
      must_respond_with :not_found
    end
  end
end
