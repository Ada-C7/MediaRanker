require "test_helper"
describe Vote do

  describe "validations" do #success case
    it "Can be created with all attributes" do

      a_work = Work.create(category: "movie",title: "A title",creator: "A name",publication_year: 2017)
      a_user = User.create(name: "Anna")
      a_vote = Vote.create!(work: a_work, user: a_user)

    end


    it "Requires a work instance and a user instance" do #failure case test
      a_vote = Vote.new
      result = a_vote.valid?
      result.must_equal false
    end
  end


end # END describe Work
