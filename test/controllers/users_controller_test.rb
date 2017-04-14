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
  end


end


describe "show" do
  it "displays all of " do
    
  end
end




end
