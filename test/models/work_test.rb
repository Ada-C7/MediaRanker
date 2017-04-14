require "test_helper"

describe Work do
  describe 'validations' do
    it "is invalid without a category" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end
  end
end
