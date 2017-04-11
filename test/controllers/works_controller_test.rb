require "test_helper"

describe WorksController do
  # it "must be a real test" do
  #   flunk "Need real tests"
  # end
  describe "album_index" do
    it "responds successfully" do
      
    end
  end

  describe "show" do
    it "shows a work that exists" do
      work = Work.first
      get work_path(work)
      must_respond_with :success
    end
  end
end
