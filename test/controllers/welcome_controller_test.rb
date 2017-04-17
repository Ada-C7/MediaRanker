require "test_helper"

describe WelcomeController do
  describe "index" do
    it "shows index page" do
      get root_path
      must_respond_with :success
    end
  end
end
