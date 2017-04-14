require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

describe UsersController do
  it "should get index" do
    get users_path
    value(response).must_be :success?
  end

  it "should get new" do
    get new_user_path
    value(response).must_be :success?
  end

  
  # it "should get delete" do
  #   get users_delete_url
  #   value(response).must_be :success?
  # end
  #
  # it "should get show" do
  #   get users_show_url
  #   value(response).must_be :success?
  # end

end
end
