require "test_helper"

describe VotesController do


  it "shoud affect the model when creating a vote" do

proc{

  post vote_path, params: {vote:
  { work_id: 3333,
    user_id: 4444
  }
}

}.must_change 'Vote.count', 1

  end
end
