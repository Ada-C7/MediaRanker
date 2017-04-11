require "test_helper"

describe WelcomeController do
  #one nested describe block for each controller
  describe "index" do #model method #wants you to ignore the instance variables, just focus on request and responses. if i put this in the black box, what do I get out of the black box?
    it "Responds successfully" do
      # Work.count.must_be :>, 0 #if no books, we want to fail this test immediately
      get welcome_path #sending get request to the url
      must_respond_with :success #success corresponds to a status code
    end
    #what if there aren't any books?
    it "still responds successfully when there are no works" do
      Work.destroy_all #wipes the test database (populated from fixtures) for this test. ok to do this because the test database regenerates for each test.
      get welcome_path
      must_respond_with :success
    end
  end
end
