require "test_helper"

describe MoviesController do

  it "should get index" do
    get movies_path
    must_respond_with :success
  end

  it "should get show" do
    get movie_path(contents(:shrek).id)
    must_respond_with :success
  end

  it "should retrieve the edit page" do
    get edit_movie_path(contents(:shrek).id)
    must_respond_with :success
  end

  it "should update a movie object" do
    patch movie_path(contents(:shrek).id), params: {content: { description: "Test" } }
    must_respond_with :found
    must_respond_with :redirect
    must_redirect_to movie_path

  end

end
