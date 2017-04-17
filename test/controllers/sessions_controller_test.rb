require 'test_helper'

describe SessionsController do
    describe 'create' do
        it 'redirects to login page if username is incorrect' do
            user_data = { user: { name: '983546252.9373593610' } }
            post login_path, params: user_data
            must_redirect_to login_path
        end
    end

    describe 'destroy' do
        it 'logs out a user' do
            user_data = { user: { name: 'Ada' } }
            post login_path, params: user_data
            delete logout_path, params: user_data
            must_redirect_to home_path
        end
    end
end
