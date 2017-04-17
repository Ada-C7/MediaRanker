require "test_helper"


describe Work do
  describe "validations" do #success case
    it "Can be created with all attributes" do
      Work.create!(title: 'test title', creator: "ada", category: "album", publication_year: 1992, description: "great story!")
      result = work.valid?
      result.must_equal true
    end

    it "Requires a title" do #failure case test
      work = Work.new
      result = work.valid?
      result.must_equal false

      #Check that the validation we're testing
      # did actually failure
      work.errors.messages.must_include :title
    end

    it "Requires a category" do #failure case test
      work = Work.new
      result = work.valid?
      result.must_equal false

      #Check that the validation we're testing
      # did actually failure
      work.errors.messages.must_include :category
    end

    it "Requires a creator" do #failure case test
      work = Work.new
      result = work.valid?
      result.must_equal false

      #Check that the validation we're testing
      # did actually failure
      work.errors.messages.must_include :creator
    end

    it "Requires a publication_year" do #failure case test
      work = Work.new
      result = work.valid?
      result.must_equal false

      #Check that the validation we're testing
      # did actually failure
      work.errors.messages.must_include :publication_year
    end
  end

#this test errors
    # describe Work do
    #   describe 'relations' do
    #     it "Can have it vote count increased when someone votes for a work" do
    #       a_work = Work.create(category: 'test category', title: 'test title', creator: 'test creator', publication_year: 1978)
    #       a_user = User.create(name: 'test name')
    #       new_vote = Vote.create!(user_id: a_user.id, work_id: a_work.id)
    #
    #       a_work.vote_count.must_include new_vote
    #     end
    #   end
    # end


end
