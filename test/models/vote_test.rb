require "test_helper"

describe Vote do
  describe 'relations' do
    let (:vote) {Vote.new}

    it "can set the user through 'user'" do
      vote.user = users(:user1)
      vote.user_id.must_equal users(:user1).id
    end

    it "can set the user through 'user_id'" do
      vote.user_id = users(:user1).id
      vote.user.must_equal users(:user1)
    end

    it "can set the work through 'work'" do
      vote.work = works(:hp)
      vote.work.id.must_equal works(:hp).id
    end

    it "can set the work through 'work_id'" do
      vote.work_id = works(:hp).id
      vote.work.must_equal works(:hp)
    end
  end

  describe "validations" do
    it "can be created with all attributes" do
      Vote.create!(user: users(:user1), work: works(:coexist))
    end

    it "must have a unique combination of 'work_id and user_id'" do
      Vote.create!(user: users(:user1), work: works(:coexist))
      duplicate_vote = Vote.new(user: users(:user1), work: works(:coexist))

      result = duplicate_vote.valid?
      result.must_equal false

      duplicate_vote.errors.messages.must_include :user
    end

    it "allows the same user to be assoicated with different works" do
      Vote.create!(user: users(:user1), work: works(:coexist))
      Vote.create!(user: users(:user1), work: works(:belong))
    end
  end
end
