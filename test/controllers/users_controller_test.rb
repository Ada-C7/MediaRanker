require "test_helper"

describe UsersController do
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
  describe "pull a user from the database" do

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

  describe "retrieve a user from the database for a session" do

  end

  describe "Session" do

  end

end
