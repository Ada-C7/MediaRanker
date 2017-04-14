require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    value(response).must_be :success?
  end

  it "should get new" do
    get new_album_path
    value(response).must_be :success?
  end

  it "should get update" do
    get edit_album_path(:id => 1)
    value(response).must_be :success?
  end

end
