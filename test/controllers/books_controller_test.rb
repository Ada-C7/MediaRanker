require "test_helper"

describe "BooksControllerTest" do
  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should get new" do
    get new_book_path
    must_respond_with :success
  end
end
