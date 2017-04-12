require "test_helper"

describe SessionsController do
  describe "create" do
    it "should redirect to root path after creation" do
      # user = User.create!(username: "nananaana", date_of_joining: "21/01/2014")
      # work_data =  {username: "test"}
      # post login_path , params: work_data
      # must_redirect_to root_path
    end
    it "rerenders new login form if username is invalid" do
      work_data = {user: {username: "test", date_of_joining: "21/01/1992"}}
      post login_path , params: work_data
      must_respond_with :bad_request
    end
  end

  describe "destroy" do
    it "deletes current session and goes back to root page" do
      delete logout_path
      session[:user_id].must_equal nil
      must_redirect_to root_path
    end
  end

end
