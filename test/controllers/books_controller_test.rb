require "test_helper"

describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should get show" do
    get book_path(contents(:hp).id)
    must_respond_with :success
  end

  it "should get the edit page" do
    get edit_book_path(contents(:hp).id)
    must_respond_with :success
  end

  it "should update a book object" do
    patch book_path(contents(:hp).id), params: {content: { description: "Test" } }
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to book_path
  end

  it "should get the new page" do
    get new_book_path
    must_respond_with :success
  end

  it "should destroy a book" do
    proc {
  # run the delete verb on the post_path with a param equal to 1
  delete book_path(contents(:hp).id)
  }.must_change 'Content.count', -1
  end

end
