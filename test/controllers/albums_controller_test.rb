require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    value(response).must_be :success?
  end

end
