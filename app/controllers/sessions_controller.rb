class SessionsController < ApplicationController

    #gets the login_form
    def login_form; end

    def login
        user = User.find_by_name(params[:name])


        if session[:user_id] = user.id
            flash[:success] = "Hiya #{user.id}"
            redirect_to root_path
        else
            user = User.new
            user.name = params[:name]
            user.save
            session[:user_id] = user.id
            flash[:success] = "Welcome #{user.id}"
            redirect_to root_path
        end
    end
end
