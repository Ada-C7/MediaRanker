require "test_helper"

describe UsersController do
  describe "index" do
    it "Goes throuh successfully" do
      get users_path
      must_respond_with :success
    end

    it "Display multiple users" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "It is successfully when there are zero users" do
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
    it "creates a new user" do
      start_count = User.count

      user_params = {
        user: {
          name: "Tola"
        }
      }
      post users_path, params: user_params
      must_redirect_to users_path

      end_count = User.count
      end_count.must_equal start_count + 1

      user = User.last
      user.name.must_equal user_params[:user][:name]
    end

    it "responds with bad_request for bogus data" do
      start_count = User.count

      user_params = {
        user: {
          t: "Hola"
        }
      }
      post users_path, params: user_params
      must_redirect_to new_user_path

      end_count = User.count
      end_count.must_equal start_count
    end
  end

  describe "show" do
    it "finds a user that exits" do
      user_id = User.first.id
      get user_path(user_id)
      must_respond_with :success
    end

    it "returns 404 for a user that DNE" do
      user_id = User.last.id + 1
      get user_path(user_id)
      must_respond_with :not_found
    end
  end

  describe "destroy" do
    it "deletes a user that exits" do
      start_count = User.count

      user_id = User.first.id
      delete user_path(user_id)
      must_redirect_to users_path

      end_count = User.count
      end_count.must_equal start_count - 1
    end

    it "returns 404 for a user that DNE" do
      start_count = User.count

      user_id = User.last.id + 1
      delete user_path(user_id)
      must_respond_with :not_found

      end_count = User.count
      end_count.must_equal start_count
    end
  end
end
