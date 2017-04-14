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

  describe "show" do
    it "should get show" do
      get :show, params: { id: 1 }
      must_respond_with :success
    end
    # #good data test
    # it "should return a work's info based on the id" do
    #   get :show, params: { id: 2 }
    #   assigns(:works).must_equal(works(:two))
    # end
  end

  describe "new" do
    it "should get new" do
    end

    it "should create an array with nil" do
      #is this right??
    end

  end

  describe "create" do
    it "should create a new instance of Work/add it to the database" do

    end

    it "should redirect to works path" do
    end

  end


end
