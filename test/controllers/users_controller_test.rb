require "test_helper"

#basic controller tests: do an input, get the correct http response
#or if we're doing something that changes the database, did the database chagne

describe UsersController do

describe "index" do
  it "shows the users" do
    User.count.must_be :>,0
    get users_path
    must_respond_with :success
  end

  it "still responds successfully when there are no users" do
    User.destroy_all
    get users_path
    must_respond_with :success
  end
end

describe "new" do
  it "successfully loads the new user page" do
    get new_user_path
    must_respond_with :success
  end
end


describe "create" do
  it "adds a new user to the database" do
    start_count = User.count
    user = {user:{username: "cho chang"}}

    post users_path, params: user
    must_redirect_to users_path

  end_count = User.count
  end_count.must_be :==, start_count + 1
  User.last.username.must_equal user[:user][:username]
  end

  it "rejects bad user data" do
    start_count = User.count
    user = {user:{username: ""}}

    post users_path, params: user
    must_respond_with :bad_request

    end_count = User.count
    end_count.must_be :==, start_count
  end
end


describe "update" do
  it "changes a user in the database" do
    start_count = User.count
    user = {user:{username: "cho chang"}}

    post users_path, params: user
    must_redirect_to users_path

  end_count = User.count
  end_count.must_be :==, start_count + 1
  User.last.username.must_equal user[:user][:username]
  end

end

describe "show" do
  it "finds a user that exists" do
    user_id = User.first.id
    get users_path(user_id)
    must_respond_with :success
  end


    it "returns 404 for a classroom that DNE" do
      user_id = User.last.id + 1
      get users_path(user_id)
      must_respond_with :not_found
    end
end




end
