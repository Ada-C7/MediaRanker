require "test_helper"

require "test_helper"

describe WorksController do

  describe 'index' do
    it "it displays index page with works" do
      Work.count.must_be :>, 0
      get works_path
      must_respond_with :success
    end

    it "displays when no works" do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "routes to the /new path" do
      get new_work_path
      must_respond_with :success
    end
  end


  describe "create" do
    it "adds a work to the database" do
      new_work = {
        work: {
          title: "Cry, the Beloved Country",
          created_by: "Alan Paton",
          description: "Best book ever",
          published: 2007,
          category: "books"
        }
      }
      post works_path, params: new_work
      must_redirect_to works_path
    end

    it "renders the new page if entered incorrectly" do
      new_work = {
        work: {
          title: nil
        }
      }
      post works_path, params: new_work
      must_respond_with :bad_request
    end
  end

  describe "update" do
    it "adds work to database and redirects" do
      work = Work.find_by(title: "Tusk")

      patch work_path(work), params: {work: {title: "UPDATED!" } }

      works(:tusk).title.must_equal "UPDATED!"

      must_respond_with :redirect

    end
  end

  describe "show" do
    it "shows a workthat exists" do
      work= Work.first.id
      get work_path(work)
      must_respond_with :success
    end
  end

  it "return a 404 if the workdoesn't exist" do
    work_id = Work.last.id
    work_id += 1
    get work_path(work_id)

    must_respond_with :not_found
  end
end
