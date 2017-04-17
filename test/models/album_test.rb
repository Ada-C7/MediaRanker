require "test_helper"

describe Album do
  describe 'validations' do
    it 'requires a title' do
      album = Album.new
      result = album.valid?
      result.must_equal false
    end

    it 'requires a title' do
      album = Album.new(title: "This")
      result = album.valid?
      result.must_equal true
    end
  end
end
