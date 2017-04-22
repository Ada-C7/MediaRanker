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

  describe "relations" do
    it "has a list of items" do
      item = items(:item1)
      item.must_respond_to :votes
      item.votes.each do |vote|
        vote.must_be_kind_of Vote
      end
    end

    it "has a list of users" do
      item = items(:item1)
      item.must_respond_to :users
      item.users.each do |user|
        user.must_be_kind_of User
      end
    end
  end


  describe "methods" do
    describe "by_category" do
      it "returns an Array of items of the given category"do
      Item.by_category(:book).must_be_kind_of Array
      Item.by_category(:book).each do |item|
        item.category.must_equal "book"
        end
      end

      describe "spotlight" do
        it "returns the item with the most votes" do
          Item.spotlight.must_be_kind_of Item
          Item.spotlight.must_equal items(:item1)
        end
      end
    end
  end

end
