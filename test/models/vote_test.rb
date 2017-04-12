require "test_helper"

describe Vote do
  describe "user relationships" do
    it 'can set the user through "user"' do
      user = User.create!(username: "Test User")
      #include work if validations are needed?
      # work = Work.create!(title: "Test", creator: "Test Creator", category: "movie")
      vote = Vote.new
      vote.user = user

      vote.user_id.must_equal user.id
    end

    it 'can set the user through "user_id"' do
      user = User.create!(username: "Test User")
      #include work if validations are needed?
      # work = Work.create!(title: "Test", creator: "Test Creator", category: "movie")
      vote = Vote.new
      vote.user_id = user.id
      
      vote.user.must_equal user
    end
  end

  describe "work relationships" do
    it 'can set the work through "work"' do
      work = Work.create!(title: "Test", creator: "Test Creator", category: "movie")
      #include user if validations are needed?
      # user = User.create!(username: "Test User")
      vote = Vote.new
      vote.work = work

      vote.work_id.must_equal work.id
    end

    it 'can set the work through "work_id"' do
      work = Work.create!(title: "Test", creator: "Test Creator", category: "movie")
      #include user if validations are needed?
      # user = User.create!(username: "Test User")
      vote = Vote.new
      vote.work_id = work.id

      vote.work.must_equal work
    end
  end
end
