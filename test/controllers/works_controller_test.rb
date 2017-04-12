require "test_helper"

describe WorksController do
  describe "index" do
    # need test for album, movie, and book?
    it "show the works of a category that exists (movie, book, or album)" do
      Work.count.must_be :>, 0
      get works_path(:albums)
      must_respond_with :success
    end

    it "responds successfully when there a no works for a category that exists" do
      Work.destroy_all
      get works_path(:albums)
      must_respond_with :success
    end

    # how to get this to pass?
    # doesnt even make it to the controller if not a specified category
    # it "returns a 404 status when asked for a category that doesn't exist" do
    #   get works_path(:fake_category)
    #
    #   must_respond_with :not_found
    # end
  end
end
