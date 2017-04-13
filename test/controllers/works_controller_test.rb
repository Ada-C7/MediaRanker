require "test_helper"

describe WorksController do

  describe "index" do
    it "should get index" do
      get :index, params: { category: "book" }
      must_respond_with :success
    end

    it "returns a collection of works based off of the category" do
      get :index, params: { category: "book" }
      assigns(:works).must_equal([works(:two)])
      # don't have to test if it's the correct category because the model already does that/tests
    end

  end



end
