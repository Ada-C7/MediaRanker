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

  describe 'show' do

    it 'should show a users page' do
      id = User.first.id
      get user_path(id)
      must_respond_with :success
    end

    it 'returns a 404 if work DNE' do
      user = User.first
      id = user.id
      user.destroy
      get user_path(id)
      must_respond_with :not_found
    end
  end

  # describe 'edit' do
  #   it 'shows you an edit page/form' do
  #     work_id = Work.first.id
  #     get edit_work_path(work_id)
  #     must_respond_with :success
  #   end
  # end
end
