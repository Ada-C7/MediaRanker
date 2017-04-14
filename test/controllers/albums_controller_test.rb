require "test_helper"

describe AlbumsController do
    it "should get the new form" do
        get new_album_path
        must_respond_with :success
    end
end
