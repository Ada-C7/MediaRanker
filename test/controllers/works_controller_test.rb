require "test_helper"

describe WorksController do
  describe "index" do
      it "works" do
        Work.count.must_be :>, 0
        get root_path
        must_respond_with :success
      end

      it "still responds if there are no works" do
        Work.destroy_all
        get root_path
        must_respond_with :success
      end

      it "still responds if there are no works" do
        Work.where(category: "album").destroy_all
        get root_path
        must_respond_with :success
      end
  end

  describe "pull a work from the database" do
      it "should get show" do
        get work_path(works(:pretzel).id)
        must_respond_with :success
      end

      it "should return a 404 if the work doesn't exist" do
          work_id = Work.last.id
          work_id += 1
          get work_path(work_id)

          must_respond_with :not_found
      end
  end

  describe "create a new work" do
    it "runs new succesfully" do
      get new_work_path(category: "albums")
      must_respond_with :success
    end
    it "should be able to create a new work" do
      start_count = Work.count
      work_data = {
        work: {
          title: "Things",
          category: "album"
          }
        }
        post works_path(category: "album"), params: work_data
      must_redirect_to works_path
      end_count = Work.count
      end_count.must_equal start_count + 1

      work = Work.last
      work.title.must_equal work_data[:work][:title]
    end

    it "re-renders the new work form if the work is invalid" do
      work_data = {
        work: {
          category: "album"
          }
        }
      post works_path(category: "albums"), params: work_data
      must_respond_with :bad_request
    end
  end
  describe "edit a work" do
    it "should be able to find a work that exists" do
      work_id = Work.first.id
      get edit_work_path(work_id)
      must_respond_with :success
    end

    it "returns 404 for a work that does not exist" do
      work_id = Work.last.id + 1
      get edit_work_path(work_id)
      must_respond_with :not_found
    end
  end
  describe "update a work" do
    it "should be able to update a work" do
      work = Work.first
      work_params = {
        work: {
        title: work.title + " oh yeah this is a test"
        }
      }
      patch work_path(work.id), params: work_params

      updated_work = Work.first
      updated_work.title.must_equal work_params[:work][:title]

      must_redirect_to works_path(category: work.category.pluralize)
    end

    it "Responds with bad_request for data" do
      work = Work.first
      work_params = {
        work: {
          category: "so bad so bad so bad"
          }
        }
      patch work_path(work.id), params: work_params
      must_respond_with :bad_request
    end

    it "returns a 404 for a work that does not exist" do
      work_params = {
        work: {
        title: " oh yeah this is a test with valid data booyeah"
        }
      }
      work_id = Work.last.id + 1
      patch work_path(work_id), params: work_params
      must_respond_with :not_found
    end

  end
    describe "delete" do
      it "destroys a work that exists" do
        start_count = Work.count

        work_id = Work.first.id
        delete work_path(work_id)
        must_redirect_to root_path

        end_count = Work.count
        end_count.must_equal start_count - 1
      end

      it "returns 404 for a work that does not exist" do
        start_count = Work.count

        work_id = Work.last.id + 1
        delete work_path(work_id)
        must_respond_with :not_found

        end_count = Work.count
        end_count.must_equal start_count
      end
  end

end
