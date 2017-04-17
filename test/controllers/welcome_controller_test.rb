require "test_helper"

describe WelcomeController do
  describe "index" do
    it "is successful when there are many books" do
      Work.count.must_be :>, 0
    end

    it "should get index" do
      get root_path
      must_respond_with :success
    end

  end
end
