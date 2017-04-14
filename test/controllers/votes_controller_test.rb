require "test_helper"

describe VotesController do

  it "should create a new vote" do

    proc   {
      post create_login_path, { username: "helloWorld" }
      post book_vote_path(contents(:hp).id)
  }.must_change 'User.find(users(:user).id).votes.length', 1
  end

end
