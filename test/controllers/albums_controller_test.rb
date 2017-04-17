require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should get new" do
    get new_album_path
    must_respond_with :success
  end

  it "should be able to create a new album" do
    my_params = {
      work: {
        title: "This is new",
        publication_year: "1999"
      }
    }

    proc {
      post albums_path, params: my_params
    }.must_change 'Work.count', 1

    must_respond_with :redirect
    must_redirect_to albums_path
  end
end
