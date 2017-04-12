require "test_helper"


class AlbumsControllerTest < ActionDispatch::IntegrationTest

describe AlbumsController do
  it "should get index" do
    get albums_index_url
    value(response).must_be :success?
  end

end
end
