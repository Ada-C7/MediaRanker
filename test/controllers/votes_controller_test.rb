require "test_helper"

describe VotesController do
  let(:vote) { votes :one }

  it "gets index" do
    get votes_url
    value(response).must_be :success?
  end

  it "gets new" do
    get new_vote_url
    value(response).must_be :success?
  end

  it "creates vote" do
    expect {
      post votes_url, params: { vote: {  } }
    }.must_change "Vote.count"

    must_redirect_to vote_path(Vote.last)
  end

  it "shows vote" do
    get vote_url(vote)
    value(response).must_be :success?
  end

  it "gets edit" do
    get edit_vote_url(vote)
    value(response).must_be :success?
  end

  it "updates vote" do
    patch vote_url(vote), params: { vote: {  } }
    must_redirect_to vote_path(vote)
  end

  it "destroys vote" do
    expect {
      delete vote_url(vote)
    }.must_change "Vote.count", -1

    must_redirect_to votes_path
  end
end
