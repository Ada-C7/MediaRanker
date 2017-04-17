require 'test_helper'

describe Vote do
    describe 'relations' do
        it 'can see the user through "user"' do
            user = User.create!(name: 'Tofu')
            vote = Vote.new

            vote.user = user

            vote.user_id.must_equal user.id
        end

        it 'can set the user through "user_id"' do
            user = User.create!(name: 'Tofu')
            vote = Vote.new

            vote.user_id = user.id

            vote.user.must_equal user
        end

        it 'can see the work through "work"' do
            work = Work.create!(title: 'The Tales of Tofu', category: 'book')
            vote = Vote.new

            vote.work = work

            vote.work_id.must_equal work.id
        end

        it 'can set the user through "work_id"' do
            work = Work.create!(title: 'The Tales of Tofu', category: 'book')
            vote = Vote.new

            vote.work_id = work.id

            vote.work.must_equal work
        end
    end
end
