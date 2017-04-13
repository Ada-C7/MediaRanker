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

  it "should destroy a book" do
    proc {
  # run the delete verb on the post_path with a param equal to 1
  delete book_path(contents(:hp).id)
  }.must_change 'Content.count', -1
  end

end
