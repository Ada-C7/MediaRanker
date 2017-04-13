class SessionsController < ApplicationController

    #gets the login_form
    def login_form; end

    def login
        user = User.find_by_name(params[:name])

        if user
            session[:user_id] = user.id
            session[:user_name] = user.name
            flash[:success] = "Hiya #{user.id}"
            redirect_to root_path
        else
            new_user = User.new
            new_user.name = params[:name]
            new_user.save
            session[:user_id] = new_user.id
            flash[:success] = "#{new_user.name} added!"
            redirect_to root_path
        end
    end

    def logout
        # session[:author_id] = nil
        session.delete(:user_id)
        flash[:success] = "You are successfully logged out"
        redirect_to root_path
    end
end
