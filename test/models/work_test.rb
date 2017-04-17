require 'test_helper'

class WorkTest < ActiveSupport::TestCase
  describe "work validation" do
    it 'can be created using all attributes' do
      work = Work.new(category: 'album', title: 'abd', creator: 'someone', publication_date: '2000', description:'info here')
      work_data = Work.valid?
      work_data.must_equal true
    end

    it 'must have a category' do
      work = Work.new
      work_data = Work.valid?
      work_data.must_equal false
      work.errors.messages.must_include :category
    end

    it 'must have a category of book, movie or album' do
      work = Work.new(category: 'tree')
      work_data = Work.valid?
      work_data.must_equal false
      work.errors.messages.must_include :category
    end
  end
end
