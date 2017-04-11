require "test_helper"

describe Work do

  describe "validations" do #success case
    it "Can be created with all attributes" do
      Work.create!(category: "movie",title: "A title",creator: "A name",publication_year: 2017)
    end


    it "Requires a title" do #failure case test
      a_work = Work.new
      result = a_work.valid?
      result.must_equal false
    end
  end


end # END describe Work
