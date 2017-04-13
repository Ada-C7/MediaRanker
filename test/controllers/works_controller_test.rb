require "test_helper"

describe WorksController do
  describe "show" do
    it "shows a work that exists" do
      work = Work.first
      get work_path(work)
      must_respond_with :success
    end

    it "return a 404 if the book doesn't exist" do
      work_id = 28#Work.last.id + 1
      # work_id += 1
      get work_path(work_id)

      must_respond_with :not_found
    end
  end
end
