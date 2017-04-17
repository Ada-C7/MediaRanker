require "test_helper"

describe Work do
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

  describe "subset" do
    it "returns the first 10 elements" do
      works_index = Works.all.get_top
      works_index.size.must_equal 10
      works_index.order(:votes).must_equal
        works_index
    end


  end
end
