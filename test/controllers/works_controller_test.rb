require "test_helper"

describe WorksController do
  let(:work) {works(:my_book)}

  it "should get show" do
    get works_path(work.id)
    must_respond_with :success
  end

  it "should show 404 when work not found" do
    get work_path(4000)
    must_respond_with :missing
  end

  # it "should get form for new" do
  #   get new_work_path(work.id)
  #   must_respond_with :success
  # end

  it "should get form for edit" do
      get edit_work_path(work.id)
      must_respond_with :success
    end
  #
  # it "should show the new work form" do
  #    get new_work_path
  #    must_respond_with :success
  # end

  it "should increase the work count by one after adding work" do
  proc {
        post works_path, params: { work:
        { category: work.category,
          title: work.title
          }
        }
      }.must_change 'Work.count', 1
  end

  it "should decrease the work count by one after deleting a work" do
   proc {
        delete work_path(work.id)
   }.must_change "Work.count", -1
 end
end
