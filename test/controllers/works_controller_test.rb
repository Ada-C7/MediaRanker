require "test_helper"

describe WorksController do
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

end # END of describe WorksController
