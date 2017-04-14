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

end
