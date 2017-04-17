require "test_helper"

describe UsersController do
  describe "index" do
    it "responds succesfully" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "still responds successfully when there are no users." do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "runs successfully" do
      get new_user_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a user to the database" do
      start_count = User.count
      user_data = { user: {username: "test user"} }
      post users_path, params: user_data
      # must_redirect_to users_path
      User.count.must_equal start_count + 1

      user = User.last
      user.username.must_equal user_data[:user][:username]
    end

    it "responds with bad_request for bogus data" do
      start_count = User.count
      user_data ={
        user: {
          a: 'b'
        }
      }
      post users_path, params: user_data
      must_respond_with :bad_request

      User.count.must_equal start_count
    end
  end

  describe "show" do
    it "shows a user that exists" do
      user = User.first
      get user_path(user.id)
      must_respond_with :success
    end

    it "returns a 404 not found status when asked for a user that doesn't exist" do
      user_id = User.last.id
      user_id += 1
      get user_path(user_id)
      must_respond_with :not_found
    end
  end


  describe "destroy" do
    it "returns 404 for a user that doesn't exit" do
      start_count = User.count
      user_id = User.last.id + 1
      delete user_path(user_id)
      must_respond_with :not_found
      end_count = User.count
      end_count.must_equal start_count
    end
  end
end
