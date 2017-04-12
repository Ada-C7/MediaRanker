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
    # it "should be able to create a work" do
    #   get "/albums/new"
    #   must_respond_with :success
    #
    #   post "/albums",
    #   params: { work: {title: "Can create Thing", category: "album"}}
    #   must_respond_with :redirect
    #   must_redirect_to works_path(category: "albums")
    # end
      it "should be able to create a new work" do
        work_data = {
          work: {
            title: "Things",
            category: "album"
            }
          }
          post works_path(category: "album"), params: work_data
        must_redirect_to works_path
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

  describe "update a work" do
    it "should be able to update a work" do
      work_params = { title: "CHANGED THIS" }
      put work_path(works(:pretzel).id), params: work_params
      updated_work = Work(works(:pretzel).id)

      updated_work.title.must_equal "CHANGED THIS"

      must_respond_with :redirect
    end

  end

end
