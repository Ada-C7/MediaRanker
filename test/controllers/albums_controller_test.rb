require "test_helper"

describe AlbumsController do
  it "should get index" do
    get albums_path
    must_respond_with :success
  end

  it "should show an individual album" do
      get album_path(contents(:hacking).id)
      must_respond_with :success
  end

  it "should get an edit page" do
    get edit_album_path(contents(:hacking).id)
    must_respond_with :success
  end

  it "should delete an album object" do
    @album = Content.albums.sample
    proc {
  # run the delete verb on the post_path with a param equal to 1
  delete album_path(@album)
  }.must_change 'Content.count', -1
  end

end
