require "test_helper"

describe HomeController do
  it "responds successfully when there are media from each category" do
    Work.where(category: "album").count.must_be :>, 0
    Work.where(category: "book").count.must_be :>, 0
    Work.where(category: "movie").count.must_be :>, 0

    get home_path
    must_respond_with :success
  end

  it "responds successfully when there is one media category missing" do
    Work.where(category: "album").count.must_be :>, 0
    Work.where(category: "book").count.must_be :>, 0
    Work.where(category: "movie").destroy_all

    get home_path
    must_respond_with :success
  end

  it "responds successfully when there are no media" do
    Work.destroy_all

    get home_path
    must_respond_with :success
  end
end
