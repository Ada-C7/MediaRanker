require "test_helper"

describe Vote do
  let(:vote) { Vote.new }
  describe 'relations' do
    it "has a user" do
    end

    it "has a work" do
    end

    it "can set the user" do
    end

    it "can set the work" do
    end

    it "must have a user" do
      no_user_vote = Vote.new(user_id: nil)
      no_user_vote.must_respond_to :errors
    end

    it "must have a work" do
      no_work_vote = Vote.new(work_id: nil)
      no_work_vote.must_respond_to :errors
    end
  end
end
