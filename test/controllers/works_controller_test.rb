require 'test_helper'

class WorksControllerTest < ActionDispatch::IntegrationTest
  describe WorksController do
    it "should get index" do
      get(works_path) #should we respond with a missing code?
      must_respond_with :success #:error, :missing, :redirect
    end

#I know this test is going to fail because
#I don't yet have individual work id's tethered to work/category yet
        it "should display one work/details" do
          get(work_path(works(:album).id))
          must_respond_with :success
        end

        it "should display 404 when work not found" do
          get work_path(1)
          must_respond_with :missing
        end

        it "should show the new work form" do
          get new_work_path
          must_respond_with :success
        end

        it "should redirect to list after adding work" do
          post works_path, params: { work:
            { category: "Testing",
              title: "Woop",
              description: "Rejoice",
              year: rand(10..50) } }

          must_redirect_to works_path
        end

        it "should affect the model when creating a work" do
          proc {
            post works_path, params: { work:
              { category: "Testing",
                title: "Woop",
                description: "Rejoice",
                year: rand(10..50) } }
              }.must_change "Work.count", 1
        end
#I haven't created a delete method yet
        it "should delete a work and redirect to home page" do
          delete work_path(works.id)
          must_redirect_to works_path
        end

  end
end
