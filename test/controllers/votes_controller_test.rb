require "test_helper"

describe VotesController do

  it "should create a new vote" do
    proc   {
    post book_vote_path, params: { vote:
       { user_id: users(:user).id,
         content_id: contents(:hp).id
         }  }
  }.must_change 'users(:user).votes.length', 1
  end

end
