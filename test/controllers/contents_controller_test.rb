require "test_helper"

describe ContentsController do
  it "should get index" do
    get contents_index_url
    value(response).must_be :success?
  end

end
