require "test_helper"

class MediaRankerControllerTest < ActionDispatch::IntegrationTest

describe MediaRankerController do
  it "should get index" do
    get media_ranker_index_url
    value(response).must_be :success?
  end

end
end
