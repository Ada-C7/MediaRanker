require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest


  describe WorksController do
    it "should get index" do
      get works_path
      must_respond_with :success
    end

    it "should get new" do
      get new_work_path
      value(response).must_be :success?
    end

    it "should get update" do # why doesn't this test pass?
      get work_path
      value(response).must_be :success?
    end
    #
    # it "should get delete" do
    #   get works_delete_url
    #   value(response).must_be :success?
    # end
    #
    # it "should get show" do
    #   get works_show_url
    #   value(response).must_be :success?
    # end

  end
end
