require "test_helper"

describe Work do
  describe 'validations' do
    it 'has_many votes' do
      book = Book.new
      result = book.valid?
      result.must_equal false
    end
  end
end

# describe Work do
#   let(:work) { Work.new }
#
#   it "must be valid" do
#     value(work).must_be :valid?
#   end
end
