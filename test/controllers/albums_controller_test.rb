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
  end
end
