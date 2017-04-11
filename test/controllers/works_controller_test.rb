require "test_helper"

describe WorksController do
  describe "index" do
    it "responds successfully" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success # success -  http status code
    end
    it "still responds successfully when there are no works " do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end  # end of index block
  describe "show" do
    it "shows a work that exists" do
      w = Work.first
      get work_path(w)
      must_respond_with :success
    end
    it "return a 404 not found status when work is not exist" do
      work_id = Work.last.id + 1
      get work_path(work_id) # sending request
      must_respond_with :not_found #checking respond
    end
  end # end of show block
  describe "new" do
    it "responds successfully " do
      get new_work_path
      must_respond_with :success
    end

  end #end of new block
  describe "create" do
    it "adds a work to the database" do
      work_data = {work: {category: "movie", title: "test title",creator: "creator test", publication_year: "1111", description: "description goes here" }}
      post works_path, params: work_data
      must_redirect_to root_path
    end
    it "rerenders new work form if work is invalid" do
      work_data = {work: {title: "test titwle"}}
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end # end of create block

end
