require "test_helper"

class WorksControllerTest < ActionDispatch::IntegrationTest

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should show a work with a valid id" do
    get work_path(works(:amelie).id)
    must_respond_with :success
  end

  it "should be missing if id is not valid" do
    get work_path(2)
    must_respond_with :missing
  end

  it "should get the new view with the right category" do
    get new_with_category_path("books")
    must_respond_with :success
  end

  it "should give an error page with a wrong category" do
    get new_with_category_path("poems")
    must_respond_with :missing
  end

  it "should redirect after creating a valid book" do
    post works_path :params => {work: {title: "Three Bears", catgeory: "book", creator: "Goldilocks", year: 2015}}
    must_respond_with :success
  end

  it "should affect a model when a work is made" do
    proc {
      post works_path, {work:
        {
          title: "ABC",
          creator: "Me",
          year: "1993",
          description: "letters",
          category: "album"
        }
      }
    }.must_change 'Work.count', 1
  end

  it "should redirect to list of works after adding a valid work" do
      post works_path, {work:
        {
          title: "ABC",
          creator: "Me",
          year: "1993",
          description: "letters",
          category: "album"
        }
      }
      must_redirect_to works_path
  end


  it "should get edit" do
    get edit_work_path(works(:amelie).id)
    must_respond_with :success
  end

  it "should update a work " do
    skip
    get work_path_
    value(response).must_be :success
  end

  it "should delete a work" do
    delete work_path(works(:sympathizer).id)
    must_redirect_to works_path
  end

end
end
