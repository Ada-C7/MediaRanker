require 'test_helper'

describe UsersController do
    describe 'index' do
        it 'Responds Successfully' do
            get users_path
            must_respond_with :success
        end

        it 'Responds successfully with no users' do
            User.destroy_all
            get users_path
            must_respond_with :success
        end
    end

    describe 'new' do
        it 'should get new' do
            get users_new_url
            value(response).must_be :success?
        end
    end

    describe 'show' do
        it 'shows a user that exsis' do
            user = User.first
            get user_path(user)
            must_respond_with :success
        end

        it 'return 404 for invalid user' do
            user_id = User.last.id
            user_id += 1
            get user_path(user_id)
            must_respond_with :not_found
        end
    end

    describe 'create' do
        it 'adds a user to the database' do
            user_data = { user: { name: 'Tofu Russell' } }
            post users_path, params: user_data
            must_redirect_to users_path
        end

        it 're-renders the new user form if user is invalid' do
            user_data = { user: { name: nil } }
            post users_path, params: user_data
            must_respond_with :bad_request
        end
    end
end
