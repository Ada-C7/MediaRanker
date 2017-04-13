require "test_helper"

describe WorksController do
  it "should get index for books" do
    get works_path(media_type: "books")
    must_respond_with :success
  end

  it "should get index for albums" do
    get works_path(media_type: "albums")
    must_respond_with :success
  end

  it "should get index for books" do
    get works_path(media_type: "movies")
    must_respond_with :success
  end

  it "should fail with invalid media_type " do
    proc {
      get works_path(media_type: "panda")}.must_raise ActionController::UrlGenerationError
  end
end
