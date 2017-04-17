require "test_helper"

describe VotesController do
  def signin
    post login_path, params: {name: "anderson"}
  end

  it "should be able to create a vote" do

    signin
    proc   {
      post upvote_path(works(:movie1).id)
    }.must_change 'Vote.count', 1

    # must_respond_with :redirect
    # must_redirect_to works_path
  end

  it "user can't vote more than one for each work" do
    signin
    post upvote_path(works(:movie1).id)

    proc   {
      post upvote_path(works(:movie1).id)
    }.must_change 'Vote.count', 0

  end

  it "user can't vote if logged of" do
    proc   {
      post upvote_path(works(:movie1).id)
    }.must_change 'Vote.count', 0

  end

end
