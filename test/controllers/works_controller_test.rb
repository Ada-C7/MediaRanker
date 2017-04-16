require "test_helper"
  describe WorksController do
    describe "index" do
      it "responds succesfully" do
        Work.count.must_be :>, 0
        get list_works_path("movies")
        must_respond_with :success
      end

      it "still responds successfully when there are no works." do
        Work.destroy_all
        get list_works_path("movies")
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
      it "adds a work to the database" do
        start_count = Work.count
        work_data = { work: {title: "test work", category: "movie", publication_year: 2000 } }
        post works_path, params: work_data
        must_redirect_to list_works_path("movies")
        Work.count.must_equal start_count + 1

        work = Work.last
        work.title.must_equal work_data[:work][:title]
      end

      it "re-renders the new work form if the work is invalid" do
        work_data = { work: { title: "test work"}}
        post works_path, params: work_data
        must_respond_with :bad_request
      end

    end

    describe "show" do
      it "shows a work that exists" do
        work = Work.first
        get work_path(work.id)
        must_respond_with :success
      end

      it "returns a 404 not found status when asked for a work that doesn't exist" do
        work_id = Work.last.id
        work_id += 1
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

      it "returns 404 for a work that doesn't exist" do
        work_id = Work.last.id + 1
        get edit_work_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "update" do
      it "updates the work" do
        work = Work.first
        work_data = { work: {title: work.title + 'whatever'}}
        patch work_path(work), params: work_data
        must_redirect_to work_path(work)

        Work.first.title.must_equal work_data[:work][:title]
      end

      it "responds with bad_request for bogus data" do
        work = Work.first
        work_data = { work: {title: ""}}
        patch work_path(work), params: work_data
        must_respond_with :bad_request

        Work.first.title.must_equal work.title
      end

      it "returns 404 for a work that doesn't exist" do
        work_id = Work.last.id + 1
        work_data = { work: {title: 'whatever'}}
        patch work_path(work_id), params: work_data
        must_respond_with :not_found
      end
    end

    describe "destroy" do
      it "destroys a work that exist" do
        work_first = Work.first
        count = Work.count
        vote = Vote.create(work_id: work_first.id, user_id: User.first.id)
        delete work_path(work_first.id)
        vote.must_equal nil
        must_redirect_to main_path



      end
    end
  end
