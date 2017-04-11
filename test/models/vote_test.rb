require "test_helper"

describe Vote do
  describe 'user relations' do
    it "can set user through .user" do
      vote = Vote.new

      user = User.create!(username: "test user")
      vote.user = user

      vote.user_id.must_equal user.id
    end

    it "can set the user through .user_id" do
      vote = Vote.new

      user = User.create!(username: "test user")

      vote.user_id = user.id

      vote.user.must_equal user
    end
  end

  describe 'work relations' do
    it "can set work through .work" do
      vote = Vote.new

      work = Work.create!(category: "movie", title: "Test title")
      vote.work = work

      vote.work_id.must_equal work.id
    end

    it "can set the user through .user_id" do
      vote = Vote.new

      work = Work.create!(category: "movie", title: "Test title")

      vote.work_id = work.id

      vote.work.must_equal work
    end
  end
end
