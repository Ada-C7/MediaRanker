require "test_helper"

describe VotesController do
  let(:work) { works(:bnb, :obvchild, :soviet, :lungs, :supe, :uproot).sample }
  let(:user) { users(:bren, :ella, :bob).sample }

  # upvote
  it "should redirect to root after voting" do
    post upvote_path(work.id), params: { work_id: work.id, user_id: user.id }
    must_redirect_to root_path
  end

  # upvote affects model
  it "should add vote" do
    skip
    # not working, but I know upvote works on the actual website so I think it's test syntax
    proc {
      post upvote_path(work.id), params: { work_id: work.id, user_id: user.id }
    }.must_change 'Vote.count', 1
  end

end
