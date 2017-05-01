require "test_helper"

describe Vote do
  let(:vote) { Vote.new }
  let(:work) { Work.create(title: "h") }
  let(:user) { User.create(name: "Lau")}


  describe 'user relations' do
    it "A vote belongs to a user" do
      vote.user = user
      vote.user_id.must_equal user.id
    end

    it "let set user_id" do
      vote.user_id = user.id
      vote.user.must_equal user
    end
  end

  describe 'work relations' do
    it "A vote belongs to a work" do
      vote.work = work
      vote.work_id.must_equal work.id
    end

    it "let set user_id" do
      vote.work_id = work.id
      vote.work.must_equal work
    end
  end
end
