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
    it "returns a 404 status when asked for a category that doesn't exist" do
      # get works_path(:fake_category)
      get "/fake_category"
      #proc must raise routing error
      must_respond_with :not_found
    end
  end

  # each category? when the category is...
  describe "new" do
    it "runs successfully" do
      get new_work_path(:albums)
      must_respond_with :success
    end
  end

  # each category?
  describe "create" do
    it "adds a new work to the database" do
      start_count = Work.count

      work_data = {
        work: {
          title: "test work"
        }
      }

      post works_path(:albums), params: work_data
      must_redirect_to works_path(:albums)

      end_count = Work.count
      end_count.must_equal start_count + 1

      work = Work.last
      work.title.must_equal work_data[:work][:title]
    end

    it "responds with bad_request for bogus data" do
      start_count = Work.count

      work_data = {
        work: {
          foo: "bar"
        }
      }

      post works_path(:albums), params: work_data
      must_respond_with :bad_request

      end_count = Work.count
      end_count.must_equal start_count
    end
  end

  describe "show" do
    it "finds a work that exists" do
      work_id = Work.first.id
      get work_path(work_id)
      must_respond_with :success
    end

    it "returns 404 for a work that DNE" do
      work_id = Work.last.id + 1
      get work_path(work_id)
      must_respond_with :not_found
    end
  end

  describe "edit" do
    it "finds a work that exists" do
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
    it "updates the work do" do
      work = Work.first
      work_data = {
        work: {
          title: work.title + " extra stuff"
        }
      }

      patch work_path(work), params: work_data
      must_redirect_to works_path(CATEGORY)

      Work.first.title.must_equal work_data[:work][:title]
    end

    # bad data for a valid ID
    it "responds with bad_request for bogus data" do
      work = Work.first
      work_data = {
        work: {
          title: ""
        }
      }

      patch work_path(work), params: work_data
      must_respond_with :bad_request

      Work.first.title.must_equal work.title
    end

    # valid data for an invalid ID
    it "returns 404 for a work that DNE" do
      work_data = {
        work: {
          title: "test title"
        }
      }

      work_id = Work.last.id + 1 # bogus id
      patch work_path(work_id), params: work_data
      must_respond_with :not_found
    end
  end

  describe "destroy" do
    it "destroys a work that exists" do
      start_count = Work.count

      work_id = Work.first.id
      category = Work.first.category
      delete work_path(work_id)
      must_redirect_to works_path(category.pluralize)

      end_count = Work.count
      end_count.must_equal start_count - 1
    end

    it "returns 404 for a work that DNE" do
      start_count = Work.count

      work_id = Work.first.id + 1 # bogus id
      delete work_path(work_id)
      must_respond_with :not_found

      end_count = Work.count
      end_count.must_equal start_count
    end
  end
end
