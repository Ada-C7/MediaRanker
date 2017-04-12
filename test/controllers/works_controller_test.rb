require 'test_helper'

describe WorksController do
    describe 'index' do
        it 'Responds Successfully' do
            Work.count.must_be :>, 0
            get works_path
            must_respond_with :success
        end

        it 'Responds successfully with no works' do
            Work.destroy_all
            get works_path
            must_respond_with :success
        end
    end

    describe 'new' do
        it 'should get new' do
            get new_work_path
            must_respond_with :success
        end
    end

    describe 'create' do
        it 'adds a work to the database' do
            work_data = { work: { title: 'Tofu Russell', category: 'movie' } }
            post works_path, params: work_data
            must_redirect_to works_path
        end

        it 're-renders the new work form if user is invalid' do
            work_data = { work: { title: nil } }
            post works_path, params: work_data
            must_respond_with :bad_request
        end
    end

    describe 'update' do
        it 'should get update' do
            get works_update_url
            value(response).must_be :success?
        end
    end

    describe 'edit' do
        it 'should get edit' do
            user = User.first
            get edit_work_path(user)
            must_respond_with :success
        end
    end

    describe 'destroy' do
        it 'should get destroy' do
            get works_destroy_url
            value(response).must_be :success?
        end
    end

    describe 'show' do
        it 'shows a work that exsis' do
            work = Work.first
            get work_path(work)
            must_respond_with :success
        end

        it 'return 404 for invalid work' do
            work_id = Work.last.id
            work_id += 1
            get work_path(work_id)
            must_respond_with :not_found
        end
    end
end
