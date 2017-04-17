require "test_helper"

describe SessionsController do
  it "should get login" do
    get login_path
    must_respond_with :success
  end

  it "logs user out" do
    delete logout_path
    must_redirect_to :root
  end

end
