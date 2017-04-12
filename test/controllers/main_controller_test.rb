require "test_helper"

describe MainController do
  it "responds succesfully" do
    get main_path
    must_respond_with :success
  end
end
