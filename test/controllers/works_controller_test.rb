require "test_helper"

describe WorksController do
  describe "index" do
    it "is successful when there are many works" do
      Work.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end
  end

  describe "book_index" do
    let(:book) {Work.where(category: "book")}
    it "is successful when there are many books" do
      book.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "shows a work that exists" do
      skip
      work = Work.first
      get work_path(work)
      must_respond_with :success
    end
  end
end
