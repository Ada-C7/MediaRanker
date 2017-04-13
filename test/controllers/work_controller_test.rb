require "test_helper"

describe WorksController do
  describe "index" do
    it "responds successfully" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success
    end

    it "still responds successfully when there are no works" do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end

  describe "new" do

  end

  describe "create" do
    it "adds a work row to the database" do
      work_data = {
        work: {title: "TestTitle", category: "TestCategory", creator: "TestCreator", description: "TestDescription", pub_date: "2000"}
      }
      post works_path, params: work_data
      must_redirect_to works_path
    end

# Not fully understanding the "bad request", how did it test if the form re-rendered?
    it "re-renders the new work form if the work is invalid" do
      work_data = { work: { title: "NoCategory"}}
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

    it "returns a 404 not found status when asked for a book that doesn't exist" do
      work_id = Work.where(category: "album").last.id
      work_id += 1
      get album_path(work_id)
      must_respond_with :not_found
    end
  end
end
