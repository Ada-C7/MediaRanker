require "test_helper"

describe UsersController do
  describe "index" do

    it "responds with a list of users " do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "still responds if there are no users" do
      User.destroy_all
      get users_path
      must_respond_with :success
    end

  end

  describe "show" do
    it "shows a single user" do
      get user_path(users(:wolf).id)
      must_respond_with :success
    end

    it "should return a 404 if the user doesn't exist" do
        user_id = User.last.id
        user_id += 1
        get user_path(user_id)

        must_respond_with :not_found
    end
  end

  describe "create a new user" do
    it "can get new" do
      get new_user_path
      must_respond_with :success
    end

    it "should be able to create a new user and up the database count" do
      start_count = User.count
      user_data = {
        user: {
          name: "Sheep",
          }
        }
      post users_path, params: user_data
      must_redirect_to root_path

      end_count = User.count
      end_count.must_equal start_count + 1

      user = User.last
      user.name.must_equal user_data[:user][:name]
    end

    it "re-renders the new userform if the user is invalid" do
      start_count = User.count
      user_data = {
        user: {
          name: ""
          }
        }
      post users_path, params: user_data
      must_respond_with :bad_request
      end_count = User.count
      end_count.must_equal start_count
    end
  end
# no edit or destroy actions for user so no testing
end
