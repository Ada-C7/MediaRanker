require "test_helper"

describe WorksController do
  it "should get homepage" do
    get root_path

    must_respond_with :success
  end

  it "should get show" do
    get movie_path(works(:the_avengers).id)

    must_respond_with :success
  end

  it "should show a 404 when book not found" do
    get book_path(1)

    must_respond_with :missing
  end
end
