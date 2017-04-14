require "test_helper"

describe WorksController do

  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get show" do
    get work_path(works(:duck).id)
    must_respond_with :success
  end

  it "should show a 404 when book not found" do
    get work_path(1)
    must_respond_with :missing
  end

  it "should show the new form" do
    # no parameters when using new route
    # do new test before create, just like writing new action before create
    get new_work_path
    must_respond_with :success
  end

  it "should redirect to list after adding a book" do
    post works_path, params: { work:
      { category: (works(:duck).category),
        title: "A movie",
        creator: "Dan",
        description: "A great movie",
        publish_year: "1996"}
      }
      must_redirect_to works_path
      # assert_difference('Work.count', 1) do
      #   post :create,
    end

    it "Should affect the model when creating a book" do
      proc {
        post works_path, params: { work:
          { category: (works(:duck).category),
            title: "A movie",
            creator: "Dan",
            description: "A great movie",
            publish_year: "1996"}
          }
        }.must_change 'Work.count', 1
      end
    end
