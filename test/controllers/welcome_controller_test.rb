require "test_helper"

describe WelcomeController do
  describe "index" do
    it "Responds successfully" do
      Work.count.must_be :>, 0
      get welcome_path
      must_respond_with :success
    end

    it "Still responds successfully when there are no books" do
      Work.destroy_all
      get welcome_path
      must_respond_with :success

    end

  end
end
