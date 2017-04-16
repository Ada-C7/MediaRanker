require "test_helper"

describe WorksController do
  let(:categories) {["movies", "books", "albums"]}

  describe "index" do
    it "show the works of a category that exists (movie, book, or album)" do
      categories.each do |category|
        Work.where(category: category.singularize).count.must_be :>, 0
        get works_path(category)
        must_respond_with :success
      end
    end

    it "responds successfully when there a no works for a category that exists" do
      Work.destroy_all
      categories.each do |category|
        get works_path(category)
        must_respond_with :success
      end
    end

    it "raises an error when asked for a category that doesn't exist" do
      proc {
        get "/fake_category"
      }.must_raise ActionController::RoutingError
    end
  end

  describe "new" do
    it "runs successfully when the category is albums, books, or movies" do
      categories.each do |category|
        get new_work_path(category)
        must_respond_with :success
      end
    end

    it "raises an error when asked for a category that doesn't exist" do
      proc {
        get "/fake_category/new"
      }.must_raise ActionController::RoutingError
    end
  end

  describe "create" do
    it "adds a new work to the database for each category" do
      work_data = {
        work: {
          title: "test work"
        }
      }

      categories.each do |category|
        start_count = Work.where(category: category.singularize).count

        post works_path(category), params: work_data
        must_redirect_to works_path(category)

        end_count = Work.where(category: category.singularize).count
        end_count.must_equal start_count + 1
      end

      work = Work.last
      work.title.must_equal work_data[:work][:title]
    end

    it "responds with bad_request for bogus data regardless of the category" do
      start_count = Work.count

      work_data = {
        work: {
          foo: "bar"
        }
      }

      categories.each do |category|
        post works_path(category), params: work_data
        must_respond_with :bad_request
      end

      end_count = Work.count
      end_count.must_equal start_count
    end

    it "raises an error when asked to create a category that doesn't exist" do
      proc {
        post "/fake_category"
      }.must_raise ActionController::RoutingError
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
      must_redirect_to works_path(work.category.pluralize)

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
      category = Work.first.category.pluralize
      delete work_path(work_id)
      must_redirect_to works_path(category)

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
