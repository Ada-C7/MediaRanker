require 'test_helper'

# class WorksControllerTest < ActionDispatch::IntegrationTest
# test "should get index" do
#   get works_index_url
#   assert_response :success
# end  #this auto generated, whould I keep it? why?
describe WorksController do
  describe "index" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get welcome_path #(url?)
      must_respond_with :success
    end

    it "responds even when there is no media (work)" do
      Work.destroy_all
      Work.all.length.must_equal 0
      # must_respond_with :success
    end

  end

  describe "new" do
    it "runs successfully" do
      get new_album_path
      must_respond_with :success
    end
  end
  #
  describe "create" do

    it "adds a work to the database" do
      work_data = {
        work: {
          category: "book",
          title: "test book",
          creator: "someone",
          publication_date: "3084",
          description: "some stuff"
        }
      }
      post welcome_path, params: work_data
      must_redirect_to welcome_path
    end
  end
  #
  #   it "returns correct count" do
  #     start_count = Work.count
  #     post welcome_path
  #
  #     must_redirect_to classrooms_path
  #
  #     end_count.must_equal start_count + 1
  #   end
  #
  #   it "shows the new work form again if the work is invalid" do
  #     work_data = {
  #       work: {
  #         category: "book",
  #         title: "test book",
  #         creator: "someone",
  #         publication_date: "3084",
  #         description: "some stuff"
  #       }
  #     }
  #     post welcome_path, params: work_data
  #     must_respond_with :bad_request
  #   end
  # end
  #
  # describe "show" do
  #   it "finds a media that exists" do
  #     work = Work.first.id
  #     get album_path(work)
  #     must_respond_with :success
  #   end
  #
  #   it "return a 404 if the media doesn't exist" do
  #     work = Work.last.id
  #     work += 1
  #     get album_path(work)
  #
  #     must_respond_with :not_found
  #   end
  # end
  #
  # describe "edit" do
  #   it "finds a media that exists" do
  #     work = Work.first.id
  #     get welcome_path(work)
  #     must_respond_with :success
  #   end
  #
  #   it "return a 404 if the book doesn't exist" do
  #     work = Work.last.id
  #     work += 1
  #     get welcome_path(work)
  #
  #     must_respond_with :not_found
  #   end
  #
  #   describe "destroy" do
  #   end
  #
  #   describe "update" do
  #     it "updates the work" do
  #       work_data = {
  #         work: {
  #           category: "book",
  #           title: "test book",
  #           creator: "someone",
  #           publication_date: "3084",
  #           description: "some stuff"
  #         }
  #       }
  #       work = Work.first.id
  #       patch welcome_path(work), params: welcome_path
  #       must_redirect_to welcome_path(work)
  #     end
  #
  #     it "responds with bad_request for bad data" do
  #
  #     end
  #
  #     it "returns 404 for media that does not exist" do
  #     end
  #   end
  #
  # end
end
