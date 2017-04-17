require "test_helper"

describe MoviesController do
  describe "create" do
    it "creates a new movie" do
      start_count = Work.movies.count

      post login_path, params: {:username=>"sofia"}

      movie_data = {
        work: {
          title: "Who am I",
          publication_year: 1994
        }
      }

      post movies_path, params: movie_data
      must_redirect_to movies_path

      end_count = Work.movies.count
      end_count.must_equal start_count + 1
    end

    it "responds with bad_request for bogus data" do
      start_count = Work.movies.count

      post login_path, params: {:username=>"sofia"}
      movie_data = {
        work: {
          title: " ",
          publication_year: 1994
        }
      }

      post movies_path, params: movie_data
      must_respond_with :bad_request

      end_count = Work.movies.count
      end_count.must_equal start_count
    end
  end

  describe "new" do
    it "return success" do
      get movies_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "is successful when there are many movies" do
      Work.movies.count.must_be :>, 0
      get movies_path
      must_respond_with :success
    end

    it "is successful when there are zero movies" do
      Work.movies.destroy_all
      get movies_path
      must_respond_with :success
    end
  end
end
