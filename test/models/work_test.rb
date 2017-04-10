require "test_helper"

describe Work do


  describe "validations" do
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

    it "Category should be only letter" do
      w = Work.new(category: "1234", title: "ABCDE", creator: "Abc", publication_year: 1993 )
      result = w.valid?
      result.must_equal false
    end


  end # end of validation block
end
