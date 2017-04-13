require "test_helper"

describe WorksController do
  describe "index" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get welcome_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no books" do
      Work.destroy_all
      get welcome_path
      must_respond_with :success
    end
  end # END of describe "index" do

  describe "albums" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no albums" do
      Work.destroy_all
      get albums_path
      must_respond_with :success

    end
  end # END of describe "albums"

  describe "books" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no books" do
      Work.destroy_all
      get books_path
      must_respond_with :success

    end
  end # END of describe "books"

  describe "movies" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get movies_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no movies" do
      Work.destroy_all
      get movies_path
      must_respond_with :success

    end
  end # END of describe "movies"

  describe "show" do
    it "shows a work that exist" do
      album = works(:album_1)
      get work_path(album)
      must_respond_with :success
    end

    it "return 404 not found status when album does NOT exist" do
      work_id = 42
      get work_path(work_id)
      must_respond_with :not_found
    end
  end # END of describe "show"

  describe "edit" do
    it "routes to the edit page" do
      album = works(:album_1)
      get edit_work_path(album)
      must_respond_with :success
    end

  end # END of describe "edit"

  describe "update" do
    it "Update a work and redirect" do
      work_data = works(:album_2)
      put works_path, params: work_data
      # must_redirect_to works_path
    end

    it "Rerenders the edit work form if the work input is invalid" do
      work_data = { work: { title: "test book"}} #Note that the several fields for the work is missing
      put works_path, params: work_data
      must_respond_with :bad_request
    end
  end # END of describe "update"


end # END of describe WorksController
