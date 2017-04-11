require "test_helper"

describe MediarankerController do

  it "should get index" do
    get root_path #need to include HTTP action and path
    must_respond_with :success
  end

end
