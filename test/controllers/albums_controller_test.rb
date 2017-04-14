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

  it "should get update" do # http://stackoverflow.com/questions/21708256/no-route-matches-missing-required-keys-id
    get album_path
    value(response).must_be :success?
  end

end
