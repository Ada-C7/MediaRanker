require "test_helper"

describe SessionsController do
  it "should get login form" do
    get login_path
    must_respond_with :success
  end
end
