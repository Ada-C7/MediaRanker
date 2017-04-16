require "test_helper"

describe WorksController do
  describe "index" do

    it "should get index" do
      get works_path
      must_respond_with :success
    end
  end

  describe "show" do
    it "should get show page" do
      get work_path(works(:one).id)
      must_respond_with :success
    end

    it "should show a 404 when work not found" do
      get work_path(1)
      must_respond_with :missing
    end
  end

  describe "category_show" do
    it "should get category show page" do
      get works_path("albums")
      must_respond_with :success
    end
  end

  describe "new" do
    it "should show the new form" do
      get new_work_path
      must_respond_with :success
    end
    # it "should show a 404 when work not found" do
      # work_id = Work.last,id + 1
    #   get new_work_path(work_id)
    #   must_respond_with :missing
    # end

  end

  describe "edit" do
    it "gets edit form should show edit page" do
      get edit_work_path(works(:one).id)
      must_respond_with :success
    end

    # it "should show a 404 when work not found" do
    #   work_id = Work.last.id + 1
    #   get edit_work_path(work_id)
    #   must_respond_with :missing
    # end


  end

  describe "create" do
    it "should be able to create a work" do
      proc {
        post works_path(work:
          { title: "Testing",
            created_by: "Kelly",
            category: "books",
            description: "Something"
          })
      }.must_change 'Work.count', 1
      must_respond_with :redirect
      must_redirect_to category_path("books")
    end
  end

  describe "update" do
    it "should update a work" do
      work = Work.first
      work_data = {
        work: {
            title: work.title,
            created_by: work.created_by,
            category: work.category,
            description: work.description + "something"
        }
      }
      patch work_path(work.id), params: work_data
      must_redirect_to work_path(work)



    end

    it "should show a 404 when work not found" do
      work_data = {
        work: {
          title: "",
          created_by: "Kelly",
          category: "book",
          description: "something"
        }
      }
      work_id = Work.last.id + 1
      patch work_path(work_id), params: work_data
      must_respond_with :not_found
    end



    #
    # it "responds with bad_request for invalid data" do
    #   work = Work.first
    #   work2 = Work.last
    #   work_data = {
    #     work: {
    #         title: work2.title,
    #         created_by: work.created_by,
    #         category: work.category,
    #         description: work.description
    #     }
    #   }
    #   patch work_path(work.id), params: work_data
    #   must_respond_with :bad_request
    # end


  end


  describe "delete" do
    it "should delete a work and redirect to worklist" do
      delete work_path(works(:one).id)
      must_redirect_to category_path("books")
    end

    it "should affect the model when deleteing a work" do
      proc {
        delete work_path(works(:one).id)
      }.must_change 'Work.count', -1
    end

    # it "should show a 404 when work not found" do
    #   work_id = Work.last.id + 1
    #   delete work_path(work_id)
    #   must_respond_with :missing
    # end
    # it "should not affect the model when deleteing a work not found" do
    #   proc {
    #     work_id = Work.last.id + 1
    #     delete work_path(work_id)
    #   }.must_change 'Work.count', 0
    # end
  end


end
