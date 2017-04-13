require "test_helper"

describe SessionsController do

  describe 'login' do
    before do
      User.create(username: "cynbin")
    end

    it 'logsin a user' do
      user_data = { username: "cynbin"}
      User.find_by(username: "cynbin").wont_be_nil

      post login_path, params: { user: user_data }
      must_respond_with :redirect
      must_redirect_to homepage_path
    end

    it 'creates a new user if username is not already created' do
      user_data = { username: "i<3wine"}
      post login_path, params: { user: user_data }
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
