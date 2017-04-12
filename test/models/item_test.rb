require "test_helper"

describe Item do

  describe 'validations' do
    it 'Can be created with all attributes' do
    item = Item.new(category: 'album', title: 'Flood', creator: 'TMBG', publication_year: '1990', description:'The one that put They Might Be Giants on the map!')
    result = item.valid?
    result.must_equal true
    end

    it 'requires a category' do
      item = Item.new
      result = item.valid?
      result.must_equal false
      item.errors.messages.must_include :category
    end

  it 'requires a category of album, book, or movie' do
    item = Item.new(category: 'dog')
    result = item.valid?
    result.must_equal false
    item.errors.messages.must_include :category
 end

  end
end
