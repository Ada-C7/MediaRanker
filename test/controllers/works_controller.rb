require 'test_helper'

describe WorksController do

  describe "index" do
    it "lists all the works" do
    #must_be is a method with two arguments the symbolized version of what you're
    #doing and whatever you expect the value to be
    Work.count.must_be :>, 0
    get works_path
    must_respond_with :success
    end

    it "still responds successfully when there are no works" do
      Work.destroy_all
      get works_path
      must_respond_with :success
    end
  end


  describe "new" do

    it "successfully loads the new work page" do
    get new_work_path
    must_respond_with :success
    end
  end

  describe "create" do
    it "adds a work to the database" do
      start_count = Work.count
      work_data = {
        work: {
          title: "test work",
          created_by: "keith sweat",
          category: "album",
          published: "1998",
        }
      }

      end_count = Work.count
      post works_path, params: work_data
      must_redirect_to  works_path
      end_count.must_be :==, start_count + 1

    end

    it "re-renders the new work form if the  work is invalid" do
    work_data = {work:{title: "test work"} }
      post works_path, params: work_data
      must_respond_with :bad_request
    end
  end

  describe "update" do
    it "changes a record in the database" do
      a = Work.find(1)
      work_data = {work: {title: "test work", id: 1}}
      patch  work_path(a.id), params: work_data

      must_redirect_to work_path(a)
      a.title.must_equal "test work"

      print a
    end

    it "redirects to edit work path if invalid" do
      a = Work.find(1)
      work_data = {work: {title: "",id: 1}}
      patch  work_path(a), params: work_data
      must_redirect_to edit_work_path

    end
  end

  describe "show" do
    it "retrieves works that exist" do
      work = Work.first
      get works_path(work)
      must_respond_with :success
    end

    it "returns 404 not found if the work id doesn't exist" do
      #you can set the id randomly but you can also get the last one
      # work_id = 1337
      work_id = Work.last.id
      work_id += 1
      get work_path(work_id)

      must_respond_with :not_found
    end
  end

  describe "destroy" do
    it "destroys a record in the database" do
      a = Work.last
      start_count = Work.count
      delete work_path(a)
      must_redirect_to works_path
    end_count = Work.count
      start_count.wont_equal end_count
    end
  end

  describe "vote" do
        # I'm worried that the way my method is written, I must pass a session hash
        #with user_id value and a params hash with id value for a vote to be created.

        #code below as written in controller:
        # works_vote = Vote.create!(user_id: session[:user_id], work_id:params[:id])
    it "creates a vote" do
      vote_data = {user_id: User.first.id, work_id: Work.first.id}
        puts vote_data
      post vote_path(:sara), params: vote_data
    end
  end

end
