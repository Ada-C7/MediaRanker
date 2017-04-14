require "test_helper"

describe WorksController do
  before do
    get works_path
    request.env["HTTP_REFERER"] = "coming_from_works"

    get login_path
    request.env["HTTP_REFERER"] = "coming_from_login"
  end

  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get books index" do
    get category_path("books")
    must_respond_with :success
  end

  it "should show a 404 when media index not found" do
    get category_path("bad_path")
    must_respond_with :missing
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

  it "should show the new book form" do
    get new_work_path("books")
    must_respond_with :success
  end

  it "should show the new movie form" do
    get new_work_path("movies")
    must_respond_with :success
  end

  it "should show the new album form" do
    get new_work_path("albums")
    must_respond_with :success
  end

  it "should show a 404 when form not found" do
    get new_work_path("broken")
    must_respond_with :missing
  end

  it "should redirect to the list after adding work" do
    post works_path, params: { work: {
      title: "Testing",
      category: "movie"
      }
    }
    must_redirect_to works_path
  end

  it "should affect the model when creating a work" do
    proc {
      post works_path, params: { work: {
        title: "Testing",
        category: "album"
        }
      }
    }.must_change 'Work.count', 1
  end

  def sign_in
    post login_path, params: { username: "New User" }
  end

  it "should affect the Vote model when a user upvotes" do
    sign_in
    proc {
      patch upvote_path(works(:graduate).id)
    }.must_change 'Vote.count', 1
  end

  it "should not add vote when user tries to upvote same thing twice" do
    sign_in
    patch upvote_path(works(:bone_people).id)
    proc {
      patch upvote_path(works(:bone_people).id)
    }.must_change 'Vote.count', 0
  end

  it "no vote added when upvote clicked when not logged in" do

  end
end
