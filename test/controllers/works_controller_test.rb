require "test_helper"

describe WorksController do
  let(:album) { works(:album) }
  let(:book) { works(:book) }
  let(:movie) { works(:movie) }

  it "should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get new work page" do
    get new_work_path(album.id)
    must_respond_with :success
  end

  it "should get edit work page" do
    get edit_work_path(album.id)
    must_respond_with :success
  end

  it "should get work show page" do
    get work_path(album.id)
    must_respond_with :success
  end

  it "should show a 404 error when work not found" do
    album.id = nil
    get work_path(album.id)
    must_respond_with :missing
  end

  it "should get books category page" do
    get books_path
    must_respond_with :success
  end

  it "should redierct books page after adding a new book" do

  end

  it "should affect the model when adding a new book" do

  end

  it "should delete a book and rediect to the books page" do

  end

  it "should get albums category page" do
    get albums_path
    must_respond_with :success
  end

  it "should redierct to albums page after adding a new album" do

  end

  it "should affect the model when adding a new album" do

  end

  it "should delete a album and rediect to the albums page" do

  end

  it "should get movies category page" do
    get movies_path
    must_respond_with :success
  end

  it "should redierct to movies page after adding a new movie" do

  end

  it "should affect the model when adding a new movie" do

  end

  it "should delete a movie and rediect to the movies page" do
    
  end
end
