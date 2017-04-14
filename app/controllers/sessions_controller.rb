class SessionsController < ApplicationController

     def login_form
          @user = User.new
     end

     def login
          user = User.find_by_username(params[:username])

               if user
                    flash[:success] = "#{user.username}, welcome back. Go forth and vote."
                    session[:user_id] = user.id
                    redirect_to user_path(user.id)
               else
                    user = User.create(user_params)
                    flash[:success] = "#{user.username}, you're now ready to deploy. Vote wisely."
                    session[:user_id] = user.id
                    redirect_to user_path(user.id)
               end
     end

     def logout
          session[:user_id] = nil
          flash[:sucess] = "Disengaged. Your your strategic vote deployment will be missed."
          redirect_to root_path
     end

     private

     def user_params
          params.permit(:username)
     end

end
