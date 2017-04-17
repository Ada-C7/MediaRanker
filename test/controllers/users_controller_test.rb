require 'test_helper'

describe UsersController do
    describe 'index' do
        it 'Responds Successfully' do
            User.count.must_be :>, 0
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
            get new_user_path
            must_respond_with :success
        end
    end

    describe 'show' do
        it 'shows a user that exsis' do
            user = User.first
            get user_path(user)
            must_respond_with :success
        end

        it 'return 404 for invalid user' do
            user_id = User.last.id + 1
            get user_path(user_id)
            must_respond_with :not_found
        end
    end

    describe 'create' do
        it 'adds a user to the database' do
            start_count = User.count

            user_data = { user: { name: 'Tofu' } }

            post users_path, params: user_data
            must_redirect_to users_path

            end_count = User.count
            end_count.must_equal start_count + 1

            user = User.last
            user.name.must_equal user_data[:user][:name]
        end

        it 'responds with bad_request for bogus data' do
            start_count = User.count

            user_data = { user: { name: '' } }

            post users_path, params: user_data
            must_respond_with :bad_request

            end_count = User.count
            end_count.must_equal start_count
        end
    end
end
