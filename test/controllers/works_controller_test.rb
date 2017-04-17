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
        it 'creates a new media' do
            start_count = Work.count

            work_data = { work: { title: 'Tofu Russell', category: 'movie' } }

            post works_path, params: work_data
            must_redirect_to movies_path

            end_count = Work.count
            end_count.must_equal start_count + 1

            work = Work.last
            work.title.must_equal work_data[:work][:title]
        end

        it 'responds with bad_request for bogus data' do
            start_count = Work.count

            work_data = { work: { title: '', category: 'test' } }

            post works_path, params: work_data
            must_respond_with :bad_request

            end_count = Work.count
            end_count.must_equal start_count
        end
    end

    describe 'update' do
        it 'updates the work' do
            work = Work.first
            work_data = { work: { title: 'Tofu Russell' + 'extra stuff', category: 'movie' } }

            patch work_path(work), params: work_data
            must_redirect_to work_path(work)

            Work.first.title.must_equal work_data[:work][:title]
        end

        it 'responds with bad_request for bogus data' do
            work = Work.first
            work_data = { work: { title: '', category: '' } }

            patch work_path(work), params: work_data
            must_respond_with :bad_request

            Work.first.title.must_equal work.title
        end

        it 'returns 404 for work that DNE' do
            work_data = { work: { title: 'Tofu Russell' + 'extra stuff', category: 'movie' } }

            work_id = Work.last.id + 1
            patch work_path(work_id), params: work_data
            must_respond_with :not_found
        end
    end

    describe 'edit' do
        it 'finds a work that exsists' do
            work_id = Work.first.id
            get edit_work_path(work_id)
            must_respond_with :success
        end

        it 'return 404 for invalid work' do
            work_id = Work.last.id + 1
            get edit_work_path(work_id)
            must_respond_with :not_found
        end
    end

    describe 'destroy' do
        it 'destroys a work that exsists' do
            start_count = Work.count

            work_id = Work.first.id
            delete work_path(work_id)
            must_redirect_to home_path

            end_count = Work.count
            end_count.must_equal start_count - 1
        end

        it 'returns 404 for a work that DNE' do
            start_count = Work.count

            work_id = Work.last.id + 1
            delete work_path(work_id)
            must_respond_with :not_found

            end_count = Work.count
            end_count.must_equal start_count
        end
    end

    describe 'show' do
        it 'shows a work that exsis' do
            work_id = Work.first.id
            get work_path(work_id)
            must_respond_with :success
        end

        it 'return 404 for invalid work' do
            work_id = Work.last.id + 1
            get work_path(work_id)
            must_respond_with :not_found
        end
    end
end
