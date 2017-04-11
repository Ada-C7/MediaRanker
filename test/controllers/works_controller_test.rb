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

  #pos update route
  it "should redirect to index after adding a work" do
    post works_path params: { work:
            { title: "Title",
              category: "book",
              creator: "creator",
              pub_yr: 1970,
              desc: "Desc" }
          }
    must_redirect_to works_path
  end

  #neg update route - NOT SURE HOW TO TEST THIS
  # it "should render new page with errors if work was not saved" do
  #   post works_path params: { work:
  #           { title: "",
  #             category: "book",
  #             creator: "creator",
  #             pub_yr: 1970,
  #             desc: "Desc" }
  #         }
  #   must_render new_work_path
  # end

  #pos create update test
  it "should affect the model when updating a book" do
    proc {
      post works_path, params: { work:
          { title: "Title",
            category: "book",
            creator: "creator",
            pub_yr: 1970,
            desc: "Desc" }
          }
      }.must_change 'Work.count', 1
  end

  #neg create update test - Not sure if this is actually testing
  #What I want it to test.
  it "should not affect the model when book is invalid" do
    proc {
      post works_path, params: { work:
          { title: "",
            category: "book",
            creator: "creator",
            pub_yr: 1970,
            desc: "Desc" }
          }
      }.must_change 'Work.count', 0
  end

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
