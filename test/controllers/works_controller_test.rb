require "test_helper"

describe WorksController do
  describe 'Works#index' do
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

    it "should raise error with invalid media_type " do
      proc {
        get works_path(media_type: "panda")}.must_raise ActionController::UrlGenerationError
    end
  end

  describe 'Works#new' do
    it "should get new_book for books" do
      get new_work_path(media_type: "books")
    end

    it "should get new_book for books" do
      get new_work_path(media_type: "movies")
    end

    it "should get new_book for books" do
      get new_work_path(media_type: "albums")
    end
  end
end
