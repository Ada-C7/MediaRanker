require "test_helper"

describe BooksController do
  it "should get index" do
    get books_index_url
    value(response).must_be :success?
  end

  it "should get show" do
    get books_show_url
    value(response).must_be :success?
  end

end
