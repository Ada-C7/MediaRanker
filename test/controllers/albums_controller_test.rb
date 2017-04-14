require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should show the new album form" do
  end

  it "should redirect to album list after adding a work" do
  end

  it "should effect the work model when creating a work" do
    # maybe this only needs to be tested in works controller?
  end

end
