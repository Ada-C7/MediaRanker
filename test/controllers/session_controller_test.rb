require "test_helper"

describe SessionController do
  it "retrieves the login page" do
    get login_path
    must_respond_with :success
  end
end
