require "test_helper"

describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end
end
