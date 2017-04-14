require "test_helper"

describe UsersController do

  describe 'index' do
    it "it displays index page with users" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "displays when no users" do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "routes to the /new path" do
      get new_user_path
      must_respond_with :success
    end
  end


  describe "create" do
    it "adds a user to the database" do
      new_user = {
        user: {
          name: "George"
        }
      }
      post users_path, params: new_user
      must_redirect_to users_path
    end

    it "directs to the index with no log-in warning" do
      user_data = { user: { name: nil } }
      post users_path, params: user_data
      must_redirect_to users_path
    end
  end

  describe "update" do
    it "redirects to the adds user to database" do
      user = User.find_by(name: "Suzie")

      patch user_path(user), params: {user: {name: "UPDATED!" } }

      users(:suzie).name.must_equal "UPDATED!"

      must_respond_with :redirect

    end
  end

  describe "show" do
    it "shows a user that exists" do
      user = User.first.id
      get user_path(user)
      must_respond_with :success
    end
  end

  it "return a 404 if the user doesn't exist" do
    user_id = User.last.id
    user_id += 1
    get user_path(user_id)

    must_respond_with :not_found
  end
end
