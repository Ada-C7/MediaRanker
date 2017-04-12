require "test_helper"

class VotesControllerTest < ActionDispatch::IntegrationTest

describe VotesController do
  it "should get index" do
    get votes_index_url
    value(response).must_be :success?
  end

  it "should get new" do
    get votes_new_url
    value(response).must_be :success?
  end

  it "should get update" do
    get votes_update_url
    value(response).must_be :success?
  end

  it "should get delete" do
    get votes_delete_url
    value(response).must_be :success?
  end

  it "should get show" do
    get votes_show_url
    value(response).must_be :success?
  end

end
end
