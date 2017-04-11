require "test_helper"

describe Work do
  let(:work) { Work.new }

  describe 'validations' do
    it "is invalid without a title" do
      work.valid?.must_equal false
    end

    it "is invlaid without a valid category" do
      work.valid?.must_equal false
    end
  end

end
