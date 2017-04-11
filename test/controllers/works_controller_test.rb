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
            get works_new_url
            value(response).must_be :success?
        end
    end

    describe 'create' do
        it 'should get create' do
            get works_create_url
            value(response).must_be :success?
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
            get works_edit_url
            value(response).must_be :success?
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
