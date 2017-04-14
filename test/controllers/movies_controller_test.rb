require "test_helper"

class MoviesControllerTest < ActionDispatch::IntegrationTest

describe MoviesController do
  it "should get index" do
    get movies_path
    value(response).must_be :success?
  end

end
end
