require "test_helper"

class MediaRankerControllerTest < ActionDispatch::IntegrationTest

describe MediaRankerController do
  it "should get index" do
    get root_path
    must_respond_with :success
  end
  it "should get new" do
    get new_work_path
    value(response).must_be :success?
  end

  it "should get update" do
    get work_path
    value(response).must_be :success?
  end
end
end
