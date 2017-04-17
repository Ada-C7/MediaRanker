require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should get new form" do
      get new_album_path
      must_respond_with :success
    end
end
