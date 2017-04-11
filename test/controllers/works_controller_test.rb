require "test_helper"

describe WorksController do
  describe "index" do
    it "responds successfully" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success # success -  http status code
    end
    it "still responds successfully when there are no works " do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end
  describe "show" do
    it "shows a work that exists" do
      w = Work.first
      get work_path(w)
      must_respond_with :success
    end
    it "return a 404 not found status when work is not exist" do
      work_id = Work.last.id + 1
      get work_path(work_id)
      must_respond_with :not_found
    end

  end

end
