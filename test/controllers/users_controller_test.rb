require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  describe UsersController do

    it "should get user index" do
      get(users_path) #should we respond with a missing code?
      must_respond_with :success #:error, :missing, :redirect
    end

    it "should be able to create a new user from login page" do
      #should return a form with a get
      #should save user
    end

    #def "data base should change as a result" do
    #end

  end

end
