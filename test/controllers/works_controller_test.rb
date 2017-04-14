require "test_helper"

describe WorksController do
  it "Should get index" do
    get root_path
    must_respond_with :success
  end

  it "should get show page" do
  end

  it "should get edit page (I think this is a good controller gets?)" do
  end

  it "should show a 404 when book not found" do
  end

  it "should delete a work and redirect to appropriate category path" do
  end

  it "should effect the model when deleting a work" do
  end

end
