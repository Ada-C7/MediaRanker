require "test_helper"

describe Work do
  describe "validations" do
    it "is invalid without a title or a category" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end

    it "is invalid without just a category" do
        work = Work.new(title: "Things")
        result = work.valid?
        result.must_equal false
    end

    it "is invalid without just a title" do
      work = Work.new(category: "album")
      result = work.valid?
      result.must_equal false
    end

    it "is valid with a title and a category" do
      work = Work.new(title: "stuff", category: "album")
      result = work.valid?
      result.must_equal true
    end

    it "is invalid with an unincluded category" do
      work = Work.new(title: "stuff", category: "stuff")
      result = work.valid?
      result.must_equal false
    end
  end

  describe "relations" do
    it "contains a vote collection" do
      user = User.first
      work = Work.first
      test_vote = Vote.create(user_id: user.id, work_id: work.id)

      work.votes.must_include test_vote
    end
    
    it "can call a user through the vote" do
      user = User.first
      work = Work.first
      test_vote = Vote.create(user_id: user.id, work_id: work.id)

      work.users.must_include user
    end
  end
end
