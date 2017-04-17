require "test_helper"

describe SubmissionsController do

     it "creates submission" do
          expect {
               post submissions_path, params: { submission: { title: 'Return of the Jedi' } }
          }.must_change "Submission.count"
     end

     it "creates submission" do
          post submissions_path, params: { submission: { title: 'Return of the Jedi', category: 'Album' } }
          must_redirect_to albums_path
     end

     it "shows submission" do
          get submission_path(submissions(:empire).id)
          must_respond_with :success
     end

     it "gets edit" do
          get edit_submission_path(submissions(:star).id)
          must_respond_with :success
     end

     it "updates submission" do
          patch submission_path(submissions(:empire).id), params: { submission: { title: 'Return of the Jedi', category: 'Movie' } }
          must_redirect_to movies_path
     end

     it "destroys submission" do
          expect {
              delete Submission.last
          }.must_change "Submission.count"

          # must_redirect_to submissions_path
     end
end
