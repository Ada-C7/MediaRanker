require "test_helper"

describe AlbumsController do
  describe "create" do
    it "creates a new album" do
      start_count = Work.albums.count

      post login_path, params: {:username=>"sofia"}

      album_data = {
        work: {
          title: "Who am I",
          publication_year: 1994
        }
      }

      post albums_path, params: album_data
      must_redirect_to albums_path

      end_count = Work.albums.count
      end_count.must_equal start_count + 1
    end

    it "responds with bad_request for bogus data" do
      start_count = Work.albums.count

      post login_path, params: {:username=>"sofia"}
      album_data = {
        work: {
          title: " ",
          publication_year: 1994
        }
      }

      post albums_path, params: album_data
      must_respond_with :bad_request

      end_count = Work.albums.count
      end_count.must_equal start_count
    end
  end
  describe "new" do
    it "return success" do
      get albums_path
      must_respond_with :success
    end
  end

  describe "index" do
    it "is successful when there are many albums" do
      Work.albums.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    it "is successful when there are zero albums" do
      Work.albums.destroy_all
      get albums_path
      must_respond_with :success
    end
  end
end
