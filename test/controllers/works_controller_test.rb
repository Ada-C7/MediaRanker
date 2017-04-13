require "test_helper"

describe WorksController do
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should show one work" do
    get work_path(works(:anne).id)
    must_respond_with :success
  end

  # it "should show a 404 when book not found" do
  #     get work_path(1)
  #     must_respond_with :missing
  #   end

  it "should show the new book form" do
    get new_book_path
    must_respond_with :success
  end

  it "should show the new album form" do
    get new_album_path
    must_respond_with :success
  end

  it "should show the new movie form" do
    get new_movie_path
    must_respond_with :success
  end

  # it "should redirect to list after adding book" do
  #   # get params info from strong params or html view
  #   post books_path, params: { work:
  #     { title: works(:anne).title,
  #       creator: works(:anne).creator,
  #       description: "Whatevs",
  #       category: "book"
  #       } }
  #       must_redirect_to books_path
  #   end

    end
