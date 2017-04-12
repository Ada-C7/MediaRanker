require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should show one book" do
    get work_path(works(:bone_people))
    must_respond_with :success
  end

  it "should show one movie" do
    get work_path(works(:graduate))
    must_respond_with :success
  end

  it "should show one album" do
    get work_path(works(:libertines).id)
    must_respond_with :success
  end

  it "should show a 404 when media not found" do
    get work_path(1)
    must_respond_with :missing
  end
end
