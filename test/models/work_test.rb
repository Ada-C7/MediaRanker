require "test_helper"

describe Work do

  describe "Validations" do
    it "Can be created with all attributes" do
      w = works(:pretzellogic)
      result = w.valid?
      result.must_equal true
    end

    it "Requires a category, title, creator, publication_year " do
      w = Work.new
      result = w.valid?
      result.must_equal false
      w.errors.messages.must_include :category
      w.errors.messages.must_include :title
      w.errors.messages.must_include :creator
      w.errors.messages.must_include :publication_year
    end

    it "Category should contain only letter" do
      w = Work.new(category: "1234", title: "ABCDE", creator: "Abc", publication_year: 1993 )
      result = w.valid?
      result.must_equal false
    end

    it "Publication year should be only numeric > than 0 " do
      w = Work.new(category: "movies", title: "ABCDE", creator: "Abc", publication_year: "-1993" )
      result = w.valid?
      result.must_equal false
    end

    it "has uniqueless title" do
      w1= works(:pretzellogic)
      w2 = Work.new(category: "movie", title: "Pretzel Logic", creator: "Eft", publication_year: 1793 )
      w2.valid?.must_equal false
      w2.errors.messages.must_include :title
    end
  end # end of validation block
  
end
