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

  it "should show a 404 when work not found" do
    get work_path(1)
    must_respond_with :missing
  end

  it "should show the new form" do
    # no parameters when using new route
    # do new test before create, just like writing new action before create
    get new_work_path
    must_respond_with :success
  end

  it "should redirect to list after adding a work" do
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

    it "Should affect the model when creating a work" do
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

      it "should delete a work and redirect to work list" do
        # add must change assertion to see that count decreases, edit  action to reflect invalid id error
        delete work_path(works(:goose).id)
        must_redirect_to works_path
      end

      it "Should affect the model when deleting a work" do
        proc {delete work_path(works(:goose).id) }.must_change 'Work.count', -1
      end

      it "should show one work" do
        get work_path(works(:goose).id)
        must_respond_with :success
      end

      it "should get edit" do
        get edit_work_path(works(:goose).id)
        must_respond_with :success
      end

      it "Should increment vote count by one when work is upvoted" do skip
        proc {upvote_path(works(:goose).id)
        }.must_change 'Vote.count', 1
      end

    end
