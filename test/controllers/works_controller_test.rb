require "test_helper"

describe WorksController do
  let(:work) { works(:bnb, :obvchild, :soviet, :lungs, :supe, :uproot).sample }

  # index - positive
  it "should get index" do
    get works_path
    must_respond_with :success
  end

  # show - positive
  it "should get show" do
    get work_path(work)
    must_respond_with :success
  end

  # show - negative
  it "should show 404 when work not found" do
    get work_path(1)
    must_respond_with :missing
  end

  # new - positive
  it "should get new" do
    get new_work_path
    must_respond_with :success
  end

  # create - positive
  it "should redirect to list after adding work" do
    post works_path, params: { work: { category: "book", name: "test: the saga", created_by: "test bud", pub_year: 1000, desc: "whatevs" } }
    must_redirect_to root_path
  end

  it "should affect the model when creating the work" do
    proc {
      post works_path, params: { work: { category: "book", name: "the saga of test", created_by: "test bud", pub_year: 1000, desc: "whatevs" } }
    }.must_change 'Work.count', 1
  end

  # create - negative
  it "should not add invalid work" do
    post works_path, params: { work: { category: "", name: "", created_by: "", desc: "" } }
    must_respond_with :ok
  end

  it "should not affect the model if attempting to create invalid work" do
    proc {
      post works_path, params: { work: { category: "", name: "", created_by: "", desc: "" } }
    }.must_change 'Work.count', 0
  end


  # edit - positive
  it "should get edit" do
    get edit_work_path(work)
    must_respond_with :success
  end


  # update - positive
  it "should redirect to list after updating work" do
    skip
    put edit_work_path(work), params: { work: { category: "book", name: "test: the saga", created_by: "test bud", pub_year: 1000, desc: "whatevs" } }
    must_redirect_to root_path
  end

  it "should affect the model when creating the work" do
    skip
    proc {
      patch edit_work_path(work), params: { work: { category: "book", name: "the saga of test", created_by: "test bud", pub_year: 1000, desc: "whatevs" } }
    }.must_change 'Work.count', 1
  end

  # update - negative
  it "should not update work with invalid data" do
    skip
    patch edit_work_path(work), params: { work: { category: "", name: "", created_by: "", desc: "" } }
    must_respond_with :ok
  end

  # how to test if model was not changed?
  # it "should not affect the model if attempting to update work with invalid data" do
  #   proc {
  #     patch edit_work_path(work), params: { work: { category: "", name: "", created_by: "", desc: "" } }
  #   }.must_change 'Work.count', 0
  # end

  # what was it before? what was it after? are they equal? should be no


  # destroy - positive
  it "should delete a work and redirect to work list" do
    delete work_path(work)
    must_redirect_to root_path
  end

  it "should affect the model when deleting the work" do
    proc {
      delete work_path(work)
    }.must_change 'Work.count', -1
  end

end
