require "test_helper"

describe Work do
  describe 'relations' do
    it "contains a vote that belongs to it in its .votes collection" do
      user = User.create!(username: "test user")
      work = Work.create!(category: "movie", title: "Test title")
      test_vote = Vote.create!(user_id: user.id, work_id: work.id)

      work.votes.must_include test_vote
    end

  end
end
