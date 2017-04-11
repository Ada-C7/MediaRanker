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

  describe 'relations' do
    it 'can set the user/work through "user/work"' do

      vote = Vote.new
      vote.user = users(:user_1)
      vote.work = works(:album_1)

      vote.user_id.must_equal users(:user_1).id
    end

    it 'can set the user/work through "user_id/work_id"' do

      vote = Vote.new

      # Make the models relate to one another
      vote.user_id = users(:user_1).id
      vote.work_id = works(:album_1).id

      # author should have changed accordingly
      vote.work.must_equal works(:album_1)
    end
  end


end # END describe Work
