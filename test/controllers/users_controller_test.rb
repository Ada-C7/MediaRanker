require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest

describe UsersController do
  it "should get index" do
    get users_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get users_new_url
    value(response).must_be :success?
  end

  it "should get update" do
    get users_update_url
    value(response).must_be :success?
  end

  it "should get delete" do
    get users_delete_url
    value(response).must_be :success?
  end

  it "should get show" do
    get users_show_url
    value(response).must_be :success?
  end

end
end
