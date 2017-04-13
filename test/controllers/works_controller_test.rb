require "test_helper"

describe WorksController do
  describe "index" do
    it "responds succesfully" do
      Work.count.must_be :>, 0
      get list_works_path("movies")
      must_respond_with :success
    end

    it "still responds successfully when there are no works." do
      Work.destroy_all
      get list_works_path("movies")
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a work to the database" do
      work_data = { work: {title: "test work", category: "movie", publication_year: 2000 } }
      post works_path, params: work_data
      must_redirect_to list_works_path("movies")
    end

    it "re-renders the new work form if the work is invalid" do
      work_data = { work: { title: "test work"}}
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end

  describe "show" do
    it "shows a work that exists" do
      work = Work.first
      get work_path(work.id)
      must_respond_with :success
    end

    it "returns a 404 not found status when asked for a work that doesn't exist" do
      work_id = Work.last.id
      work_id += 1
      get work_path(work_id)
      must_respond_with :not_found
    end
  end
end
# require 'test_helper'
#
# class WorksControllerTest < ActionDispatch::IntegrationTest
#   describe "index" do
#     it "responds succesfully" do
#       Work.count.must_be :>, 0
#       get works_path
#       must_respond_with :success
#     end
#
#     it "still responds successfully when there are no works." do
#       Work.destroy_all
#       get works_path
#       must_respond_with :success
#     end
#   end
#
#
#   describe "new" do
#
#   end
#
#   describe "create" do
#     it "adds a work to the database" do
#       work_data = { work: {title: "test work", author_id: Author.first.id } }
#       post works_path, params: work_data
#       must_redirect_to works_path
#     end
#
#     it "re-renders the new work from if the work is invalid" do
#       work_data = { work: { title: "test work"}}
#       post works_path, params: work_data
#       must_respond_with :bad_request
#     end
#   end
#
#   describe "show" do
#     it "shows a work that exists" do
#       work = Work.first
#       get work_path(work.id)
#       must_respond_with :success
#     end
#
#     it "returns a 404 not found status when asked for a work that doesn't exist" do
#       work_id = Work.last.id
#       work_id += 1
#       get work_path(work_id)
#       must_respond_with :not_found
#     end
#   end

end
