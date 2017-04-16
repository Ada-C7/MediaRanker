require "test_helper"

describe Book do
  describe 'validations' do
    it 'requires a title' do
      book = Book.new
      result = book.valid?
      result.must_equal false
    end
  end
end
