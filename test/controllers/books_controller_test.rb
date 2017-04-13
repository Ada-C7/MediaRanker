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

end
