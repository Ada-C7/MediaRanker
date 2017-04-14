require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest

describe BooksController do
  it "should get index" do
    get books_path
    value(response).must_be :success?
  end

  it "should get new" do
    get new_book_path
    value(response).must_be :success?
  end

  it "should get update" do
    get book_path
    value(response).must_be :success?
  end

  # it "should get delete" do
  #   get book_path
  #   value(response).must_be :success?
  # end

end
end
