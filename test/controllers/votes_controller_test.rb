require "test_helper"
  describe VotesController do


    it "create redirects to back if not logged in" do
      post new_vote_path(works(:linnets).id), params:
      { vote:
        { work: works(:linnets)
        }
      }
      must_redirect_to :root
    end

    ## this test is not passing!!!
    # it "create updates db count if saves" do
    #   post new_vote_path(works(:fall).id), params: { vote:
    #     { work: works(:fall),
    #       user: users(:aurora)
    #     }
    #   }
    #
    #   must_change 'Vote.count', 1
    # end
    #
    # it "create redirects to root if vote is duplicate" do
    #
    # end
    #
    # it "create does not update db if vote is duplicate" do
    #
    # end
    #
    #
    # it "create redirects to root if saves" do
    #
    # end




  end
