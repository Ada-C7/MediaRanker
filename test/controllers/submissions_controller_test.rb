require "test_helper"

describe SubmissionsController do
     let(:submission) { Submission.create!(title: 'Return of the Jedi') }

     it "creates submission" do
          expect {
               post submissions_url, params: { submission: { title: 'Return of the Jedi' } }
          }.must_change "Submission.count"
     end

     it "creates submission" do
          post submissions_url, params: { submission: { title: 'Return of the Jedi', category: 'Album' } }
          must_redirect_to albums_path
     end

     # it "shows submission" do
     #      get submission_url(submission)
     #      value(response).must_be :success?
     # end

     # it "gets edit" do
     # get edit_submission_url(submission)
     # value(response).must_be :success?
     # end
     #
     # it "updates submission" do
     # patch submission_url(submission), params: { submission: {  } }
     # must_redirect_to submission_path(submission)
     # end
     #
     # it "destroys submission" do
     # expect {
     #  delete submission_url(submission)
     # }.must_change "Submission.count", -1
     #
     # must_redirect_to submissions_path
     # end
end
