require "test_helper"

describe WorksController do
  describe "index" do
    it "responds successfully" do
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

  describe "album_index" do
    it "responds successfully" do
      Work.where(category: "album").count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    it "still responds successfully when there are no albums" do
      Work.where(category: "album").destroy_all
      get albums_path
      must_respond_with :success
    end
  end

  describe "book_index" do
    it "responds successfully" do
      Work.where(category: "book").count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "still responds successfully when there are no books" do
      Work.where(category: "book").destroy_all
      get books_path
      must_respond_with :success
    end
  end

  describe "movie_index" do
    it "responds successfully" do
      Work.where(category: "movie").count.must_be :>, 0
      get movies_path
      must_respond_with :success
    end

    it "still responds successfully when there are no movies" do
      Work.where(category: "movie").destroy_all
      get movies_path
      must_respond_with :success
    end
  end

  describe "new" do
    it "should get a new form" do
      get new_work_path
      must_respond_with :success
    end
  end

  describe "create" do
    it "adds a work row to the database" do
      proc {
        work_data = {
          work: {title: "TestTitle", category: "album", creator: "TestCreator", description: "TestDescription", pub_date: "2000"}
        }
        post works_path, params: work_data}.must_change 'Work.count', 1

        must_respond_with :redirect
        must_redirect_to works_path
      end

      it "does not create a work row if not respecting strong params" do
        work_data = {
          work: {foo: "bar"}
        }
        post works_path, params: work_data

        must_respond_with :bad_request
      end

      it "re-renders the new work form if the work is invalid" do
        work_data = { work: { title: "NoCategory"}}
        post works_path, params: work_data
        must_respond_with :bad_request
      end
    end

    describe "album_show" do
      it "shows an album that exists" do
        work = works(:album)
        get work_path(work.id)
        must_respond_with :success
      end

      it "returns a 404 not found status when asked for an album that doesn't exist" do
        work_id = Work.where(category: "album").last.id
        work_id += 1
        get work_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "book_show" do
      it "shows a book that exists" do
        work = works(:book)
        get work_path(work.id)
        must_respond_with :success
      end

      it "returns a 404 not found status when asked for a book that doesn't exist" do
        work_id = Work.where(category: "book").last.id
        work_id += 1
        get work_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "movie_show" do
      it "shows a movie that exists" do
        work = works(:movie)
        get work_path(work.id)
        must_respond_with :success
      end

      it "returns a 404 not found status when asked for a movie that doesn't exist" do
        work_id = Work.where(category: "movie").last.id
        work_id += 1
        get work_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "edit" do
      it "should get show" do
        get edit_work_path(works(:movie).id)
        must_respond_with :success
      end

      #### TW: This does not work
      it "should get 404 for work that DNE" do
        work_id = Work.last.id
        work_id += 1
        get edit_work_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "update" do
      it "should change the work details" do
        work = works(:book)
        updated_title = "UpdatedTitle"
        updated_creator = "UpdatedCreator"

        patch work_path(work.id), work: {id: work.id, title: updated_title, creator: updated_creator, category: work.category, description: work.description, pub_date: work.pub_date}
        work = Work.find(work.id)

        assert_equal updated_title, work.title
        assert_equal updated_creator, work.creator

        must_respond_with :redirect
        must_redirect_to work_path(work.id)
      end


      #### TW: This does not work
      # it "should show an error if mandatory fields are changed to empty" do
      #   work = works(:movie)
      #   patch work_path(work.id), work: {title: "", creator: "UpdatedCreator"}
      #
      #   must_respond_with :error
      # end

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
    end

    describe "delete/destroy" do
      it "should remove a row from the database" do
        proc {
          work = works(:movie)
          delete work_path(work.id)
        }.must_change 'Work.count', -1

        must_respond_with :redirect
        must_redirect_to works_path
      end

#### TW: This does not work
      it "should return a 404 for a work that DNE" do
        work = Work.last.id + 1
        delete work_path(work)

        must_respond_with :not_found
      end
    end
  end
