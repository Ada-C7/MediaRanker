class SessionsController < ApplicationController
    def new; end

    def create
        user = User.find_by(name: params[:name])

        if user
            session[:user_id] = user.id
            flash[:success] = "#{user.name} has loged in"
            redirect_to home_path
        else
            flash[:failure] = 'Login Failed'
            redirect_to login_path
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:logout] = "You're loged out"
        redirect_to home_path
    end
end
