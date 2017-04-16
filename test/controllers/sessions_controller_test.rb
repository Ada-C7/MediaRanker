require "test_helper"

describe SessionsController do
  describe "new" do
    it "runs successfully" do
      get login_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "Redirects to root path when a user has logged in" do
      user = User.create(name: "Lau")
      session_params = {
        name: "Lau"
      }
      post login_path, params: session_params
      must_redirect_to root_path
    end

    it "redirects to login_path if name not valid" do
      session_params = {
        user: {
          name: " "
        }
      }
      post login_path , params: session_params
      must_redirect_to login_path
    end
  end

  describe "destroy" do
    it "deletes session and redirects to root_path" do
      delete logout_path
      session[:user_id].must_equal nil
      must_redirect_to root_path
    end
  end
end
