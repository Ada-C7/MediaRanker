require "test_helper"

describe WorksController do
  let(:work) { works(:anything) }

  it "should get index" do
    get works_path
    must_respond_with :success
  end

  it "should get show page" do
    get work_path(work.id)
    must_respond_with :success
  end

  it "should show a 404 when work not found" do
    get work_path(1)
    must_respond_with :missing
  end



end
