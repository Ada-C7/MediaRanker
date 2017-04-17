require "test_helper"

describe UsersController do
  it 'should get index' do
    get users_path
    must_respond_with :success
  end

  it 'should get show' do
    get user_path(id)
    must_respond_with :success
  end

  it 'should show a 404 when user is not found' do
    get user_path(1)
    must_respond_with :missing
  end
end
