require "test_helper"

class MediaRankerControllerTest < ActionDispatch::IntegrationTest

describe MediaRankerController do
  it "should get index" do
    get root_path
    must_respond_with :success
  end

end
end
