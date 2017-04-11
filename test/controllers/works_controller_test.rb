require "test_helper"

describe WorksController do

  it "must get the index" do
    get works_path
    must_respond_with :success
  end

  it "must get the new work page" do
    get new_work_path
    must_respond_with :success
  end

  it "must get the edit work page" do
    get edit_work_path(works(:linnets))
    must_respond_with :success
  end

  it "updating work should redirect to root" do
    patch work_path, params: { work: { title: "" }}
    must_redirect_to root_path
  end

  it "must get the albums page" do
    get albums_path
    must_respond_with :success
  end

  it "must get the movies page" do
    get movies_path
    must_respond_with :success
  end

  it "must get the books page" do
    get books_path
    must_respond_with :success
  end

  it "should show an individual work" do
    get work_path(works(:linnets))
    must_respond_with :success
  end

  it "should return a 404 if work not found" do
    get work_path(1)
    must_respond_with :missing
  end

  it "must delete a work and affect the model count" do
    proc {
      delete work_path(works(:linnets))
    }.must_change 'Work.count', -1
  end

  it "must delete a work and redirect to root" do
    delete work_path(works(:linnets))
    must_redirect_to root_path
  end
  #
  # it "" do
  #
  # end


end
