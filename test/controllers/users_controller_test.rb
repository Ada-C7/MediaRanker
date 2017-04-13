require "test_helper"

describe UsersController do

  describe 'index' do
    it "it can get index page" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it "still responds successfully when there are no users" do
      User.destroy_all
      get users_path
      must_respond_with :success
    end
  end
end
