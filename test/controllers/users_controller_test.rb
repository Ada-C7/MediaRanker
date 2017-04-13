require "test_helper"

describe UsersController do

  # index should redirect to index
  it "can show all users by calling index" do
    get users_path
    must_respond_with :success
  end

  # create should change the db count
  # it "creating a new user should change the db count of users" do
  #   post user_path
  # end
  #
  #
  # # create should redirect to root
  #
  # it "creating a new user should redirect to root" do
  #
  # end
  #
  # # show should redirect to individual user's page
  # it "show user should show one user" do
  #
  # end



end
