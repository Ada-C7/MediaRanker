require 'test_helper'

describe User do
    describe 'validations' do
        it 'invalid without name' do
            user = User.new
            result = user.valid?
            result.must_equal false

            user.errors.messages.must_include :name
        end

        it 'invalid if name is already taken' do
            user_1 = User.create(name: 'Tofu')
            user = User.create(name: 'Tofu')
            result = user.valid?
            result.must_equal false

            user.errors.messages.must_include :name
        end

        it 'only allows letters, numbers, periods and underscores' do
            user_1 = User.create(name: 'Letters.4_win11')
            user_2 = User.create(name: 'Invalid!')

            result_1 = user_1.valid?
            result_2 = user_2.valid?

            result_1.must_equal true
            result_2.must_equal false

            user_2.errors.messages.must_include :name
        end
    end
end
