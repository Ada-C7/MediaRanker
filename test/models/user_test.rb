require 'test_helper'

describe User do
    describe 'validations' do
        it 'invalid without name' do
            user = User.new
            result = user.valid?
            result.must_equal false

            user.errors.messages.must_include :name
        end
    end
end
