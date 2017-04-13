require "test_helper"

describe UsersController do
  describe 'index' do

    it "gets the index page successfully" do
      User.count.must_be :>, 0
      get users_path
      must_respond_with :success
    end

    it 'still successful when there are no works' do
      User.destroy_all
      get users_path
      must_respond_with :success
    end

  end
end
