require "test_helper"

describe VotesController do

  it "should create a new vote" do
    proc   {
    post votes_path, params: { vote:
       { user_id: users(:user).id,
         content_id: contents(:hp).id
         }  }
  }.must_change 'Vote.count', 1
  end

end
