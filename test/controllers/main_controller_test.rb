require "test_helper"

describe MainController do
  it "responds succesfully" do
    get main_path
    must_respond_with :success
  end

  it "is successful when there are zero media to show" do
    Work.destroy_all
    Vote.destroy_all
    get main_path
    must_respond_with :success
  end
end
