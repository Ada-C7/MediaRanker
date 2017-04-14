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

  # describe "new" do
  #   it "routes to the /new path" do
  #     get new_work_path
  #     must_respond_with :success
  #   end
  # end
  #
  #
  # describe "create" do
  #   it "adds a work to the database" do
  #     new_work = {
  #       work: {
  #         name: "George"
  #       }
  #     }
  #     post works_path, params: new_work
  #     must_redirect_to works_path
  #   end
  #
  #   it "directs to the index with no log-in warning" do
  #     work_data = { work: { name: nil } }
  #     post users_path, params: user_data
  #     must_redirect_to users_path
  #   end
  # end
  #
  # describe "update" do
  #   it "redirects to the adds user to database" do
  #     user = Work.find_by(name: "Suzie")
  #
  #     patch user_path(user), params: {user: {name: "UPDATED!" } }
  #
  #     users(:suzie).name.must_equal "UPDATED!"
  #
  #     must_respond_with :redirect
  #
  #   end
  # end
  #
  # describe "show" do
  #   it "shows a user that exists" do
  #     user = Work.first.id
  #     get user_path(user)
  #     must_respond_with :success
  #   end
  # end
  #
  # it "return a 404 if the user doesn't exist" do
  #   user_id = Work.last.id
  #   user_id += 1
  #   get user_path(user_id)
  #
  #   must_respond_with :not_found
  # end
end
