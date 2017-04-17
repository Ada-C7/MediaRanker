require "test_helper"

describe AlbumsController do

    it "should get the index" do
        get albums_path
        must_respond_with :success
    end

    it "should get the new form" do
        get new_album_path
        must_respond_with :success
    end

    it "should create a new album" do
        proc {
            post albums_path,  { work:{category: "album", title: "Test Album", creator: "me" }}
        }.must_change 'Work.count', 1
    end

    #for create it would be nice to test the following things
    #would check if successful that the message was displayed and was redirected to the correct place
    #would check if UNSUCCESSFUL (by entering a new item that doesn't pass the validations, maybe the fixture bad_category) and for this i would also check that the message was displayed and redirected to the correct place
end
