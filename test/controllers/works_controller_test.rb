require "test_helper"

describe WorksController do
  let(:work) { works(:anything) }

  it "should get index" do
    get works_path
    must_respond_with :success
  end

  #show
  it "should get show page" do
    get work_path(work.id)
    must_respond_with :success
  end

  it "should show a 404 when work not found" do
    get work_path(999)
    must_respond_with :missing
  end

  #create
  it "should redirect to category list after adding work" do
    post works_path, params: { work:
      { category: "book",
        title: "The Orchardist",
        creator: "Amanda Coplin",
        pub_year: 2012,
        description: "Novel with apples"
        }}
    #rewrite this test to redirect to category page
    must_redirect_to root_path
  end

  it "should affect the model when creating a book" do
    proc {
      post works_path, params: { work:
      { category: "book",
        title: "The Orchardist",
        creator: "Amanda Coplin",
        pub_year: 2012,
        description: "Novel with apples"
      } }
    }.must_change 'Work.count', 1
  end

  #edit
  it "should get edit page" do
    get edit_work_path(work.id)
    must_respond_with :success
  end

  #update
  it "should redirect to category list after updating a book" do

  end

  #delete
  # it "should affect the model when deleting a book" do
  #   proc {
  #     delete works_path, work
  #   }.must_change 'Work.count', -1
  #
  # end

  it "should redirect to category list after deleting a book" do

  end


end
