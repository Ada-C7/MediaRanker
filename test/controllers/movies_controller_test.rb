require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest

describe MoviesController do
  it "should get index" do
    get movies_path
    value(response).must_be :success?
  end

  it "should get new" do
    get new_movie_path
    value(response).must_be :success?
  end

  it "should get update" do
    get edit_movie_path(:id => 1)
    value(response).must_be :success?
  end
end
end
