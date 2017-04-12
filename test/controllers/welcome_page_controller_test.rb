require "test_helper"

describe WelcomePageController do
  it "should get index" do
    get welcome_page_index_url
    value(response).must_be :success?
  end

end
