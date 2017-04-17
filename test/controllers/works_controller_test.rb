require "test_helper"

describe WorksController do
  describe "index" do
    it "Goes throuh successfully" do
      get works_path
      must_respond_with :success
    end

    it "Display multiple works" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success
    end

    it "It is successfully when there are zero works" do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "runs successfully" do
      get new_work_path
      must_respond_with :success

      get new_movie_path
      must_respond_with :success

      get new_book_path
      must_respond_with :success

      get new_album_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "creates a new work" do
      start_count = Work.count

      work_params = {
        work: {
          title: "Hola"
        }
      }
      post works_path, params: work_params
      must_redirect_to root_path

      Work.count.must_equal start_count + 1

      Work.last.title.must_equal work_params[:work][:title]
    end

    it "responds with bad_request for bogus data" do
      start_count = Work.count

      work_params = {
        work: {
          t: "Hola"
        }
      }
      post works_path, params: work_params
      must_respond_with :bad_request

      Work.count.must_equal start_count
    end
  end

  describe "show" do
    it "finds a work that exits" do
      work_id = Work.first.id
      get work_path(work_id)
      must_respond_with :success
    end

    it "returns 404 for a work that DNE" do
      work_id = Work.last.id + 1
      get work_path(work_id)
      must_respond_with :not_found
    end

    it "finds the list of movies" do
      movie = Work.find_by(category: "movie")

      get movies_path
      must_respond_with :success
    end

    it "returns 404 for a empty list" do
      Work.destroy_all
      get movies_path
      must_respond_with :not_found
    end

    it "finds the list of books" do
      book = Work.find_by(category: "book")

      get books_path
      must_respond_with :success
    end

    it "returns 404 for a empty list" do
      Work.destroy_all
      get books_path
      must_respond_with :not_found
    end

    it "finds the list of albums" do
      album = Work.find_by(category: "album")

      get albums_path
      must_respond_with :success
    end

    it "returns 404 for a empty list" do
      Work.destroy_all
      get albums_path
      must_respond_with :not_found
    end

  end

  describe "edit" do
    it "edits a work that exits" do
      work_id = Work.first.id
      get edit_work_path(work_id)
      must_respond_with :success
    end

    it "returns 404 for a work that DNE" do
      work_id = Work.last.id + 1
      get edit_work_path(work_id)
      must_respond_with :not_found
    end
  end

  describe "update" do
    it "updates the work" do
      work = Work.first
      work_params = {
        work: {
          title: work.title + "Hola carebola"
        }
      }
      patch work_path(work), params: work_params
      must_redirect_to work_path(work)

      Work.first.title.must_equal work_params[:work][:title]
    end

    it "Responds with bad request for bogus data" do
      work = Work.first
      work_params = {
        work: {
          title: " "
        }
      }
      patch work_path(work), params: work_params
      must_respond_with :bad_request

      Work.first.title.must_equal work.title
    end

    it "returns 404 for a works that DNE" do
      work_params = {
        work: {
          title: "Hola carebola"
        }
      }
      work_id = Work.last.id + 1

      patch work_path(work_id), params: work_params
      must_respond_with :not_found
    end
  end

  describe "destroy" do
    it "deletes a work that exits" do
      start_count = Work.count

      work_id = Work.first.id
      delete work_path(work_id)
      must_redirect_to works_path

      end_count = Work.count
      end_count.must_equal start_count - 1
    end

    it "returns 404 for a work that DNE" do
      start_count = Work.count

      work_id = Work.last.id + 1
      delete work_path(work_id)
      must_respond_with :not_found

      end_count = Work.count
      end_count.must_equal start_count
    end
  end
end
