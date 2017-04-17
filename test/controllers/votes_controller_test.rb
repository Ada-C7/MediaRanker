require "test_helper"

describe VotesController do

  it "should create a new vote for a book" do
  proc   {
      post create_login_path, { username: "helloWorld" }
      post book_vote_path(contents(:hp).id)
  }.must_change 'User.find(users(:user).id).votes.length', 1
end

it "should create a new vote for a movie" do
  proc   {
      post create_login_path, { username: "helloWorld" }
      post movie_vote_path(contents(:guardian).id)
  }.must_change 'User.find(users(:user).id).votes.length', 1
end

it "should create a new vote for an album" do
  proc   {
      post create_login_path, { username: "helloWorld" }
      post album_vote_path(contents(:pelican).id)
  }.must_change 'User.find(users(:user).id).votes.length', 1
end

it "should not create a new vote if the user already voted for the same content" do
  proc   {
      post create_login_path, { username: "helloWorld" }
      post album_vote_path(contents(:pelican).id)
      post album_vote_path(contents(:pelican).id)
  }.must_change 'User.find(users(:user).id).votes.length', 1
end

it "should not allow a vote if a user is not logged in" do
  proc {
  post album_vote_path(contents(:pelican).id)
  }.must_change 'contents(:pelican).votes.length', 0

end

end
