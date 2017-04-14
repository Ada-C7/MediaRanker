require "test_helper"

describe WorksController do
  let(:album) { works(:album) }
  let(:book) { works(:book) }
  let(:movie) { works(:movie) }

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get new work page" do
    get new_category_path(book.category)
    must_respond_with :success
  end

  it "should get edit work page" do
    get edit_work_path(album.id)
    must_respond_with :success
  end

  it "should get work show page" do
    get work_path(album.id)
    must_respond_with :success
  end

  it "should show a 404 error when work not found" do
    get work_path(0)
    must_respond_with :missing
  end

  it "should get the category index page" do
    get show_category_path("album")
    must_respond_with :success
  end

  it "should delete a work and rediect to the homepage" do
    delete work_path(book.id)
    must_redirect_to root_path
  end

  it "should affect the model when adding a new work" do
        proc {
          post works_path, {
            work: {
              title: "New Book",
              creator: "Sandi",
              year: 1984,
              description: "A great book",
              category: "book"
            }
      }
    }.must_change 'Work.count', 1
  end


  # it "should redierct to the homepage page after adding a new work" do
  #   post works_path, params: {
  #     album: {
  #       title: "New album",
  #       creator: "Sandi",
  #       year: 1984,
  #       description: "A great album",
  #       category: "album"
  #     }
  #   }
  #   must_redirect_to root_path
  # end
end
