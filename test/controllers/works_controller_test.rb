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

      end_count = Work.count
      end_count.must_equal start_count + 1

      # work = Work.last
      # work.title.must_equal work_params[:work title: "Hola"]
    end

    # it "responds with bad_request for bogus data" do
    #   start_count = Work.count
    #
    #   work_params = {
    #     work: {
    #       title: "Hola"
    #     }
    #   }
    #
    #
    # end
    #
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
  end
end
