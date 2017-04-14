require "test_helper"

# TO TEST:
# does the HTTP request actually succeed?
# did the database actually change

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

    it "successful when there are 0 works" do
      Work.destroy_all
      get works_path(media_type: "movies")
      must_respond_with :success
    end
  end

  describe 'Works#new' do
    it "should get new_book for books" do
      get new_work_path(media_type: "books")
      must_respond_with :success
    end

    it "should get new_book for books" do
      get new_work_path(media_type: "movies")
      must_respond_with :success
    end

    it "should get new_book for books" do
      get new_work_path(media_type: "albums")
      must_respond_with :success
    end

    it "should raise error with invalid media_type " do
      proc {
        get new_work_path(media_type: "panda")}.must_raise ActionController::UrlGenerationError
    end
  end

  describe 'Works#home' do
    it "should get new_book for books" do
      get root_path
      must_respond_with :success
    end
  end

  describe 'Works#create' do
  end

  describe 'Works#show' do
    it "should get work path" do
      work = Work.first
      get work_path(work)
      must_respond_with :success
    end
  end

  describe 'Works#edit' do
    it "should get edit_work path" do
      work = Work.first
      get edit_work_path(work)
      must_respond_with :success
    end
  end

  describe 'Works#update' do
  end

  describe 'Works#destroy' do
  end
end
