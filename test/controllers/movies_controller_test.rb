require "test_helper"

describe MoviesController do
  it "should get index" do
    get movies_path
    must_respond_with :success
  end

  it "should get new form" do
      get new_movie_path
      must_respond_with :success
    end
end
