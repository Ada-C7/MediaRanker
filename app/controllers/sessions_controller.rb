class SessionsController < ApplicationController

     def login_form
          @user = User.new
     end

     def login
          user = User.find_by_username(params[:username])

               if user
                    flash[:success] = "#{user.username}, #{user.id} Welcome back. Go forth and vote."
                    session[:user_id] = user.id
                    redirect_to user_path(3)
               else
                    user = User.create(user_params)
                    user.status = true
                    flash[:success] = "#{user.username}, #{user.id} You're on for the first time. Use your votes wisely."
                    session[:user_id] = user.id
                    redirect_to user_path(3)
               end
     end

     def logout
          session[:user_id] = nil
          flash[:sucess] = "You're off. Feel free to turn on any time."
          redirect_to root_path
     end

     private

     def user_params
          params.permit(:username)
     end

end
