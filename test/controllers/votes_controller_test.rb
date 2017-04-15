require "test_helper"

describe VotesController do
  let(:vote) { votes(:vote_bnb, :vote_obvchild, :vote_soviet).sample }

  # upvote
  # it "should redirect to root after voting" do
  #   post upvote_path(vote)
  #   must_redirect_to root_path
  # end

  # upvote affects model
  # it "should add vote" do
  #   proc {
  #     post upvote_path(:vote_uproot)
  #   }.must_change 'Vote.count', 1
  # end

end
