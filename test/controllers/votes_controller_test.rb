require "test_helper"

describe VotesController do
  it "will redirect to login page if user is not logged in to vote" do
    post new_vote_path(votes(:vote_one).id)
    must_respond_with :redirect
    must_redirect_to login_path
  end

  it "will redirect to show page if user is logged in and votes" do
    post login_path(), params: { name: users(:lynn).name } #what params is, needed for method
    post new_vote_path(works(:work_one).id)
    must_respond_with :redirect
    must_redirect_to work_path(works(:work_one).id)
  end

  it "will affect user model if vote is valid" do
    proc {
      post login_path(), params: { name: users(:lynn).name }
      post new_vote_path(works(:new_vote_work).id)
    }.must_change 'Vote.count', 1
  end

end
