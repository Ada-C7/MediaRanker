require "test_helper"

describe SessionsController do
  it "should get new" do
    get login_path
    assert_response :success
  end

end
