require "test_helper"

describe UsersController do
  describe "index" do
    it "responds successfully" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end
    it "still responds successfully when there are no users " do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end # end of index
  describe "new" do
    it "responds successfully " do
      get new_user_path
      must_respond_with :success
    end
  end #end of new
  describe "create" do
    it "adds a user to the database" do
      user_data = {user: {username: "wqwqwq", date_of_joining: "31/01/1993" }}
      post users_path, params: user_data
      must_redirect_to root_path
    end
    it "rerenders new create user form if username is already taken" do
      user_data = {user: {username: "wqwqwq", date_of_joining: "31/01/1993" }}
      post users_path, params: user_data
      user_data1 = {user: {username: "wqwqwq", date_of_joining: "31/01/1993" }}
      post users_path, params: user_data1
      must_respond_with :bad_request
    end
  end#end of create
  describe "show" do
    it "shows a user that exists" do
      u = Work.first
      get work_path(u)
      must_respond_with :success
    end
    # it "return a 404 not found status when user is not exist" do
    #   user_id = User.last.id + 1
    #   get user_path(user_id)
    #   must_respond_with :not_found
    # end
  end # end of new

end
