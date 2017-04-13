class SessionsController < ApplicationController

     def login_form; end

     def login
          user = User.find_by(params[:username])

               if user
                    flash[:success] = "#{user.username}, you're on. Go forth and vote."
                    session[:user_id] = user.id
                    redirect_to root_path
               else
                    flash.now[:error] = "Ugh. Not even. If you're a real human being, try again."
                    render :form
               end
     end

     def logout_form; end

     def logout
          session.delete(:user_id)
          flash[:sucess] = "You're off. Feel free to turn on any time."
          redirect_to root_path
     end
end
