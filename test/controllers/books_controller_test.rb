require "test_helper"

describe BooksController do
  describe "create" do
    it "creates a new book" do
      start_count = Work.books.count

      post login_path, params: {:username=>"sofia"}

      book_data = {
        work: {
          title: "Who am I",
          publication_year: 1994
        }
      }

      post books_path, params: book_data
      must_redirect_to books_path

      end_count = Work.books.count
      end_count.must_equal start_count + 1
    end

    it "responds with bad_request for bogus data" do
      start_count = Work.books.count

      post login_path, params: {:username=>"sofia"}
      book_data = {
        work: {
          title: " ",
          publication_year: 1994
        }
      }

      post books_path, params: book_data
      must_respond_with :bad_request

      end_count = Work.books.count
      end_count.must_equal start_count
    end
  end

  describe "new" do
    it "return success" do
      get books_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "is successful when there are many books" do
      Work.books.count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "is successful when there are zero books" do
      Work.books.destroy_all
      get books_path
      must_respond_with :success
    end
  end
end
