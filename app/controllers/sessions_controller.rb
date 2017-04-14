class SessionsController < ApplicationController
  def login_form; end # this is to show an empty controller action (it's still doing the render)

    def login
      #raise
      username = params[:username]

      if User.find_by_username(username)
        user = User.find_by_username(username)
        #found successfully
        #session is a rails hash helper
        session[:user_id] = user.id
        redirect_to works_path
        flash[:success] = "successfully logged as #{user.username}"

      else
        #did not find
        #or you could take an input and create a new author
        user = User.create(username: username)
        flash.now[:success] = "successfully logged as #{user.username}"
        # render :login_form
      end

    end


    def logout
      #raise
      #session[:author_id]
      session.delete(:username)
      flash[:success] = "successfully logged out"
      redirect_to works_path

    end
end
