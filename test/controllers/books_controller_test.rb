require "test_helper"

describe BooksController do
  it "should get index" do
    get books_path
    must_respond_with :success
  end

  it "should get new" do
    get new_book_path
    must_respond_with :success
  end

  it "should be able to create a new book" do
    my_params = {
      work: {
        title: "This is new",
        publication_year: "1999"
      }
    }

    proc {
      post books_path, params: my_params
    }.must_change 'Work.count', 1
    
    must_respond_with :redirect
    must_redirect_to books_path
  end
end
