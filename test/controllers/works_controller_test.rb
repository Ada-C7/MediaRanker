require "test_helper"

describe WorksController do

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

  it "should redirect to the movie list after adding movie" do
    post works_path, params: { work: {
      title: "Testing",
      category: "movie"
      }
    }
    must_redirect_to category_path("movies")
  end

  it "should redirect to the album list after adding movie" do
    post works_path, params: { work: {
      title: "Testing",
      category: "album"
      }
    }
    must_redirect_to category_path("albums")
  end

  it "should redirect to the book list after adding movie" do
    post works_path, params: { work: {
      title: "Testing",
      category: "book"
      }
    }
    must_redirect_to category_path("books")
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

  it "should show the edit book form" do
    get edit_work_path(works(:bone_people).id)
    must_respond_with :success
  end

  it "should show a 404 when editing a work that doesn't exist" do
    get edit_work_path(1)
    must_respond_with :missing
  end

  it "can change a work through update" do
    first_work = Work.first
    new_data = { work: { title: "New Title", creator: "New Creator" } }

    patch work_path(first_work.id), params: new_data
    Work.first.title.must_equal new_data[:work][:title]
  end

  it "redirects to category page after updating" do
    album = works(:libertines)

    patch work_path(album.id), params: { work: { title: "New" } }
    must_redirect_to category_path("albums")
  end

  it "destroy affects the Work model" do
    proc {
      delete work_path(works(:graduate).id)
    }.must_change 'Work.count', -1
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
    proc {
      patch upvote_path(works(:libertines).id)
    }.must_change 'Vote.count', 0
  end
end
