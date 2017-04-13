class SessionsController < ApplicationController

    #gets the login_form
    def login_form; end

    def login
        user = User.new
    end

end
