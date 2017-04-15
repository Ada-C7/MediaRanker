require 'test_helper'

describe Work do
    describe 'validations' do
        it 'invalid without a title' do
            work = Work.new(category: 'book')
            result = work.valid?
            result.must_equal false

            work.errors.messages.must_include :title
        end

        it 'invalid without a category' do
            work = Work.new(title: 'Tofu')
            result = work.valid?
            result.must_equal false

            work.errors.messages.must_include :category
        end

        it 'invalid if not integer or nil' do
            work = Work.new(title: 'Tofu', category: 'movie', published_year: 'invalid')
            result = work.valid?
            result.must_equal false

            work.errors.messages.must_include :published_year
        end

        it 'invalid if category not included' do
            work = Work.new(title: 'Tofu', category: 'kite')
            result = work.valid?
            result.must_equal false

            work.errors.messages.must_include :category
        end
    end
end
