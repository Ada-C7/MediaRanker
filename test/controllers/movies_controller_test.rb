require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_path
    must_respond_with :success
  end

  it "should get new" do
    get new_movie_path
    must_respond_with :success
  end

  it "should be able to create a new movie" do
    my_params = {
      work: {
        title: "This is new",
        publication_year: "1999"
      }
    }

    proc {
      post movies_path, params: my_params
    }.must_change 'Work.count', 1

    must_respond_with :redirect
    must_redirect_to movies_path
  end
end
