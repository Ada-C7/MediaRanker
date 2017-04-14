require "test_helper"

describe HomeController do
  it "responds successfully" do
    get home_path
    must_respond_with :success
  end
end
