require "test_helper"

describe Submission do

     describe 'validations' do
          let(:submission) { Submission.new }

          it "Able to create a submission" do
               submission.must_be_kind_of Submission
          end
     end

     describe 'relations' do
        it 'can set the vote through "vote"' do

             submission = submissions(:star)
             puts submission.title
             puts submission.votes.count
             puts votes.count
             vote_hash = { user_id:  users(:han).id, submission_id: submission.id  }
             puts submission.votes.build(vote_hash)
             puts votes.count
             puts submission.votes.count
             proc {
                  submission.votes.build(vote_hash)
             }.must_change 'submission.votes.count', 1
        end
     end
end
