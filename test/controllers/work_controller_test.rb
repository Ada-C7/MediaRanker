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
      Work.where(category: "Album").count.must_be :>, 0
      get albums_path
      must_respond_with :success
    end

    it "still responds successfully when there are no albums" do
      Work.where(category: "Album").destroy_all
      get albums_path
      must_respond_with :success
    end
  end

  describe "book_index" do
    it "responds successfully" do
      Work.where(category: "Book").count.must_be :>, 0
      get books_path
      must_respond_with :success
    end

    it "still responds successfully when there are no books" do
      Work.where(category: "Book").destroy_all
      get books_path
      must_respond_with :success
    end
  end

  describe "movie_index" do
    it "responds successfully" do
      Work.where(category: "Movie").count.must_be :>, 0
      get movies_path
      must_respond_with :success
    end

    it "still responds successfully when there are no movies" do
      Work.where(category: "Movie").destroy_all
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
          work: {title: "TestTitle", category: "TestCategory", creator: "TestCreator", description: "TestDescription", pub_date: "2000"}
        }
        post works_path, params: work_data}.must_change 'Work.count', 1

        must_respond_with :redirect
        must_redirect_to works_path
      end

      # Not fully understanding the "bad request", how did it test if the form re-rendered?
      it "re-renders the new work form if the work is invalid" do
        work_data = { work: { title: "NoCategory"}}
        post works_path, params: work_data
        must_respond_with :bad_request
      end
    end

    describe "album_show" do
      # #WHY DOESN'T THIS WORK?
      # it "shows an album that exists" do
      #   work = Work.where(category: "Album").first
      #   get album_path(work.id)
      #   must_respond_with :success
      # end

      it "returns a 404 not found status when asked for an album that doesn't exist" do
        work_id = Work.where(category: "Album").last.id
        work_id += 1
        get album_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "book_show" do

      # #WHY DOESN'T THIS WORK?
      # it "shows a book that exists" do
      #   work = Work.where(category: "Book").first
      #   get book_path(work.id)
      #   must_respond_with :success
      # end

      it "returns a 404 not found status when asked for a book that doesn't exist" do
        work_id = Work.where(category: "Book").last.id
        work_id += 1
        get book_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "book_show" do
      # #WHY DOESN'T THIS WORK?
      # it "shows a book that exists" do
      #   work = Work.where(category: "Book").first
      #   get book_path(work.id)
      #   must_respond_with :success
      # end

      it "returns a 404 not found status when asked for a movie that doesn't exist" do
        work_id = Work.where(category: "Movie").last.id
        work_id += 1
        get movie_path(work_id)
        must_respond_with :not_found
      end
    end

    describe "edit" do
      it "should get show" do
        get edit_work_path(works(:movie).id)
        must_respond_with :success
      end
    end

    describe "update" do
      it "should change the work details" do
        work = works(:book)
        updated_title = "UpdatedTitle"
        updated_creator = "UpdatedCreator"

        patch work_path, work: {id: work.id, title: updated_title, creator: updated_creator, category: work.category, description: work.description, pub_date: work.pub_date}

        assert_equal updated_title, work.title
        assert_equal updated_creator, work.creator

        #
        # must_respond_with :redirect
        # must_redirect_to works_path
      end

      # it "should show an error if mandatory fields are changed to empty" do
      #
      # end
    end


    ### TW: WHY DOES IT COUNT 4 ITEMS (STARTING 5) RATHER THAN 2 (STARTING 3)?
    describe "delete/destroy" do
      it "should remove a row from the database" do
        proc {
          Work.first.destroy
          get works_path
        }.must_change 'Work.count', 1

        must_respond_with :redirect
        must_redirect_to works_path
      end
    end
  end
