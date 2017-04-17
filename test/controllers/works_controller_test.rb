require "test_helper"

describe WorksController do
  describe "index" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get welcome_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no books" do
      Work.destroy_all
      get welcome_path
      must_respond_with :success
    end
  end # END of describe "index" do

  describe "albums" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no albums" do
      Work.destroy_all
      get albums_path
      must_respond_with :success

    end
  end # END of describe "albums"

  describe "books" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no books" do
      Work.destroy_all
      get books_path
      must_respond_with :success

    end
  end # END of describe "books"

  describe "movies" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get movies_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no movies" do
      Work.destroy_all
      get movies_path
      must_respond_with :success

    end
  end # END of describe "movies"

  describe "show" do
    it "shows a work that exist" do
      album = works(:one)
      get work_path(album)
      must_respond_with :success
    end

    it "return 404 not found status when album does NOT exist" do
      work_id = 42
      get work_path(work_id)
      must_respond_with :not_found
    end
  end # END of describe "show"

  describe "create" do
    it "creates a new work" do
      start_count = Work.count

      work_data = {
        work: {
          # category: "album",
          title: "Thrill",
          creator: "Steely Dan",
          publication_year: 1973,
          description: "hello"
        }
      }
      get '/albums'
      post works_path, params: work_data

      # must_redirect_to work_path(work_data.id)

      end_count = Work.count
      end_count.must_equal start_count + 1
    end
  end # END of describe "create"



  describe "edit" do
    it "routes to the edit page" do
      album = works(:one)
      get edit_work_path(album)
      must_respond_with :success
    end
  end # END of describe "edit"

  describe "update" do
    it "Update a work and redirect" do
      work1 = works(:two)
      work_data = {
        work1: {
          title: "Thrill",
          creator: "Steely Dan",
          publication_year: 1975,
          description: "hello"
        }
      }
      get '/albums'
      patch work_path(work1), params: work_data
      # must_redirect_to works_path
      work1.publication_year.must_equal work_data[:work1][:publication_year]
    end

    it "Rerenders the edit work form if the work input is invalid" do
      work_data = { work2: { title: "test book"}} #Note that the several fields for the work is missing
      get '/albums'
      patch work_path(work_data), params: work_data
      must_respond_with :bad_request
    end
  end # END of describe "update"

end # END of describe WorksController
