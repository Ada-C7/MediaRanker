require "test_helper"

describe Vote do
    describe 'relations' do
        it 'can find the user through "user_id"' do
            user = User.new(username: "whoever")
            work = Work.new(category: "movie", title: "One")
            vote = Vote.new(user_id: user.id, work_id: work.id)
            vote.user_id.must_equal user.id
        end

        it 'can find the work through "work_id"' do
            user = User.new(username: "whoever")
            work = Work.new(category: "movie", title: "One")
            vote = Vote.new(user_id: user.id, work_id: work.id)
            vote.work_id.must_equal work.id
        end
    end
end
