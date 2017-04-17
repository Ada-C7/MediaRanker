require "test_helper"

describe WorksController do
  describe "index" do
    it "Responds successfully" do
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

  describe "show" do
    it "shows a work that exists" do
      work = Work.first
      get work_path(work)
      must_respond_with :success
    end

    it "return a 404 if the work doesn't exist" do
      work_id = Work.last.id
      work_id += 1
      get work_path(work_id)

      must_respond_with :not_found
    end
  end
end
