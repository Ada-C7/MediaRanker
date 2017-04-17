require "test_helper"

describe Vote do

     let(:vote) { Vote.new }

     it "Able to create a vote" do
          user = Vote.new
          user.must_be_kind_of Vote
     end

end
