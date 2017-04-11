require "test_helper"

describe Work do

  describe "Validations" do
    let(:not_uniq_work) {Work.new(category: "movie", title: "Pretzel Logic", creator: "Eft", publication_year: 1793 )}
    let(:work) {Work.new}
    let(:work_all_attributes) {Work.new(category: "movie", title: "Pretzel", creator: "Eft", publication_year: 1793 )}
    it "Can be created with all attributes" do
      w = works(:pretzellogic)
      result = w.valid?
      result.must_equal true
    end
    it "is created when all atributes are given" do
      result = work_all_attributes.valid?
      result.must_equal true
    end

    it "Requires a title, creator, publication_year " do
      result = work.valid?
      result.must_equal false
      work.errors.messages.must_include :title
      work.errors.messages.must_include :creator
      work.errors.messages.must_include :publication_year
    end


    it "Publication year should be only numeric > than 0 " do
      w = Work.new(category: "movie", title: "ABCDE", creator: "Abc", publication_year: "-1993" )
      result = w.valid?
      result.must_equal false
    end

    it "has uniqueless title" do
      w1= works(:pretzellogic)
      not_uniq_work.valid?.must_equal false
      not_uniq_work.errors.messages.must_include :title
    end
  end # end of validation block

end
