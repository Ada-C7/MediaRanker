require "test_helper"

describe SessionsController do

  it "gets login form" do
    get login_path
    must_respond_with :success
  end

  # must redirect to root after login
  # HOW DO YOU DO THIS CRAP??
  # must add user to session on login

  # must redirect to root after logout

  # must remove user from session on logout

end
