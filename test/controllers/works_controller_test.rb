require "test_helper"

describe WorksController do
  describe "book_index" do
    let(:book) {Work.where(category: "book")}
    it "is successful when there are many books" do
      book.count.must_be :>, 0
      get books_path
      must_respond_with :success
    end
  end

  describe "album_index" do
    let(:album) {Work.where(category: "album")}
    it "is successful when there are many books" do
      album.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "runs successfully" do
      get new_album_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "creates a new movie" do
      start_count = Work.count

      movie_data = {
        movie: {
          category: "movie",
          title: "Great Adventures in Code",
          creator: "Ada Developers",
          publication_year: "2017",
          description: "Cohort 7, the best cohort EVA"
        }
      }
      post movies_path, params: movie_data
      must_redirect_to movies_path

      end_count = Work.count
      end_count.must_equal start_count + 1

      movie = Work.last
      movie.title.must_equal movie_data[:movie][:title]
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
