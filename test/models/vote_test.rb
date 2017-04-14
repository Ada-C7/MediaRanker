require "test_helper"

describe Vote do
  describe "it can get user information" do
    it "it can get the user id" do
      vote = Vote.new
      vote.user = User.find_by(name: "Bob")

      vote.user_id.must_equal users(:bob).id
    end

    it "it can get the media id" do
      vote = Vote.new
      vote.work = Work.find_by(title: "Tusk")
      vote.work_id.must_equal works(:tusk).id
    end
  end
end
