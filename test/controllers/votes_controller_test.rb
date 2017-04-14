require 'test_helper'

class VotesControllerTest < ActionDispatch::IntegrationTest

    describe VotesController do
      it "should keep a user from voting on the same work twice" do

        #I was really looking forward to doing this one, so even though I i haven't had time yet, I will probably still try.

        work.id = "13"
        work.creator = "Chastity Belt"
        work.title = "Time To Go Home"
        work.save.must_equal true

        work2 = Work.new
        work2.id = "13"
        work2.creator = "P.W. Herman"
        work2.title = "Fire Hose Blues"
        work2.save.must_equal false
        work2.errors.messages.must_include :id
        work2.errors.messages.must_equal ["must be unique"] #must understand use of array
      end
    end


end
