require "test_helper"

class BooksControllerTest < ActionDispatch::IntegrationTest

describe BooksController do
  it "should get index" do
    get books_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get books_new_url
    value(response).must_be :success?
  end

  it "should get update" do
    get books_update_url
    value(response).must_be :success?
  end

  it "should get delete" do
    get books_delete_url
    value(response).must_be :success?
  end

end
end
