require "test_helper"

describe VotesController do
  it "will redirect to current if user is not logged in to vote" do
    post new_vote_path(votes(:vote_one).id)
    must_respond_with :redirect
  end

  it "will redirect to current page if user is logged in and votes" do
    post login_path(), params: { name: users(:lynn).name } #what params is, needed for method
    post new_vote_path(works(:work_one).id)
    must_respond_with :redirect
  end

  it "will affect user model if vote is valid" do
    proc {
      post login_path(), params: { name: users(:lynn).name }
      post new_vote_path(works(:new_vote_work).id)
    }.must_change 'Vote.count', 1
  end

  it "will not affect user model if vote is invalid" do
    proc {
      post login_path(), params: { name: users(:lynn).name }
      post new_vote_path(works(:work_one).id)
    }.must_change 'Vote.count', 0
  end

end
