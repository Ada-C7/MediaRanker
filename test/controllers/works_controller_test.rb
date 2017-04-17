require "test_helper"

describe WorksController do
  describe "show" do
    it "finds a work that exists" do
      work = works(:one)
      get work_path(work.id)
      must_respond_with :success
    end
  end
end
