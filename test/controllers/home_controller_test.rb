require "test_helper"

describe HomeController do
     it "should get index" do
          get root_path
          must_respond_with :success
     end

     it "should get albums" do
          get albums_path
          must_respond_with :success
     end

     it "should get books" do
          get books_path
          must_respond_with :success
     end

     it "should get movies" do
          get movies_path
          must_respond_with :success
     end

     it "should get add album" do
          get add_album_path
          must_respond_with :success
     end

     it "should get add book" do
          get add_book_path
          must_respond_with :success
     end

     it "should get add movie" do
          get add_movie_path
          must_respond_with :success
     end
end
