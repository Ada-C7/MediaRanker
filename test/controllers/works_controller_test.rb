require "test_helper"

describe WorksController do

    it  "should get index" do
      get works_path
      must_respond_with :success
    end



  it "should get show page" do
    get work_path(works(:poodr).id)
    must_respond_with :success
  end
  #
  #
  # it "get edit form should show edit page" do
  #   get edit_work_path(works(:poodr).id)
  #   must_respond_with :success
  # end
  #
  # it "should show a 404 when work not found" do
  #   get work_path(1)
  #   must_respond_with :missing
  # end
  #
  # it "should show the new form" do
  #   get new_work_path
  #   must_respond_with :success
  # end
  #
  # it "should redirect to list after addding work" do
  #   post works_path params: {work:
  #     { title: "Testing",
  #       author_id: authors(:metz).id,
  #       description: "Whatevs",
  #       isbn: rand(10-50)
  #     } }
  #   must_redirect_to works_path
  # end
  #
  # it "should affect the model when creating a work" do
  #   proc {
  #     post works_path params: {work:
  #       { title: "Testing",
  #         author_id: authors(:metz).id,
  #         description: "Whatevs",
  #         isbn: rand(10-50)
  #       } }
  #   }.must_change 'Book.count', 1
  #
  # end
  #
  # it "should delete a work and redirect to worklist" do
  #   delete work_path(works(:one).id)
  #   must_redirect_to works_path
  # end
  #
  # end

end
