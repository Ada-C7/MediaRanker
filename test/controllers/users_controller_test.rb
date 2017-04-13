require "test_helper"

describe UsersController do
    it "it can get index page" do
      get users_path
      must_respond_with :success
    end

    # it "still responds successfully when there are no users" do
    #   User.destroy_all
    #   get user_path
    #   must_respond_with :success
    # end
end
