require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest
describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get show" do
    get works_show_url
    value(response).must_be :success?
  end

  it "should get create" do
    get works_create_url
    value(response).must_be :success?
  end

  it "should get edit" do
    get works_edit_url
    value(response).must_be :success?
  end

  it "should get update" do
    get works_update_url
    value(response).must_be :success?
  end

  it "should get destroy" do
    get works_destroy_url
    value(response).must_be :success?
  end

end
end
