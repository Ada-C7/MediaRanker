require "test_helper"

describe SessionsController do

  describe 'login' do

    # before do
    #   User.create(username: "cynbin")
    # end

    # got this one passing
    it 'logs-in a user' do
      user_data = { username: "cynbin"}
      user = User.create(username: "cynbin")
      # user.find_by(username: "cynbin").wont_be_nil

      post login_path(user), params: user_data
      must_respond_with :redirect
      must_redirect_to homepage_path
    end

    # can't figure out how to test that the User got created
    # it appears that my post login_path might not be what I want...
    it 'creates a new user if username is not already created' do
      user_data = { username: "i<3wine"}
      User.find_by(username: "i<3wine").must_be_nil

      post login_path, params: user_data
      User.find_by(username: "i<3wine").wont_be_nil

      must_respond_with :redirect
      must_redirect_to homepage_path

    end

    # it 'renders new page when given empty sting' do
    #   user_data = { username: ""}
    #   post login_path, params: { user: user_data }
    #   must_respond_with :
    # end
  end

  describe 'logout' do

  end
end
