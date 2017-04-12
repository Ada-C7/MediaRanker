require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should show a work with a valid id" do
    get work_path(works(:amelie).id)
    must_respond_with :success
  end

  it "should be missing if id is not valid" do
    skip #need to fix the other piece for this
    get work_path(2)
    must_respond_with :missing
  end

  it "should get the new view" do
    get new_work_path
    must_respond_with :success
  end

  it "should get create" do
    get
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
