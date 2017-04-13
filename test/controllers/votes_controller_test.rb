require "test_helper"

describe VotesController do
  it "should get show" do
    get votes_show_url
    value(response).must_be :success?
  end

end
