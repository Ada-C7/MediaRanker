require "test_helper"

describe Work do
  describe 'validations' do
    it "is invalid without a title" do
      work = Work.new
      result = work.valid?
      result.must_equal false
    end
  end

  # describe 'self.spotlight' do
  #   it "selects the work by maximum votes counts" do
  #
  #
  #     result.must_equal
  #   end
  # end
end
