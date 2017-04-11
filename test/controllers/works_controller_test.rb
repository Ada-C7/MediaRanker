require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  #pos show test
  it "should get show page" do
    get work_path(works(:work_one).id)
    must_respond_with :success
  end

  #neg show test
  it "should show a 404 if work not found" do
    get work_path(1)
    must_respond_with :missing
  end

  #pos new
  it "should get form for new work" do
    get new_work_path
    must_respond_with :success
  end

  #pos create route
  it "should redirect to index after adding a work" do
    post works_path params: { works:
            { title: "Title",
              category: "book",
              creator: "creator",
              pub_yr: 1970,
              desc: "Desc" }
          }
    must_redirect_to works_path
  end

  #pos create update test

  #neg create route

  #neg create update test

  #pos edit test
  it "should get form to edit work" do
    get edit_work_path((works(:work_one).id))
    must_respond_with :success
  end

  #neg edit test
  it "should show a 404 if work not found to edit" do
    get edit_work_path(1)
    must_respond_with :missing
  end

  #pos
end
