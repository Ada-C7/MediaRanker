require "test_helper"

describe VotesController do
  it "should be able to vote while logged in" do
    proc   {
      post login_path(name: "user")
      post vote_path(works(:lee).id)
    }.must_change 'Vote.all.count', 1
  end

  it "should not be able to vote when not logged in" do
    proc   {
      post login_path(name: "")
      post vote_path(works(:lee).id)
    }.must_change 'Vote.all.count', 0
  end

  it "should not be able to vote on the same work multiple times" do
    proc   {
      post login_path(name: "user")
      post vote_path(works(:lee).id)
      post vote_path(works(:lee).id)
    }.must_change 'Vote.all.count', 1
  end

  it "should be able to vote for a movie" do
    proc   {
      post login_path(name: "user")
      post vote_path(works(:mee).id)
    }.must_change 'Vote.all.count', 1
  end

  it "should be able to vote for a album" do
    proc   {
      post login_path(name: "user")
      post vote_path(works(:dan).id)
    }.must_change 'Vote.all.count', 1
  end

  it "should be able to vote for a book" do
    proc   {
      post login_path(name: "user")
      post vote_path(works(:lee).id)
    }.must_change 'Vote.all.count', 1
  end
end
