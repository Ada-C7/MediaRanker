require "test_helper"

describe SessionsController do
  it "should get login" do
    get sessions_login_url
    value(response).must_be :success?
  end

end
