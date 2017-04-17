require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest

describe VotesController do
  it "should get index" do
    get votes_path
    value(response).must_be :success?
  end

  it "should get upvote" do
    post votes_upvote_path
    value(response).must_be :success?
  end
end
end
