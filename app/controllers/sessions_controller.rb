class SessionsController < ApplicationController
  def login_form; end # this is to show an empty controller action (it's still doing the render)

    def login
      #raise
      user = User.find_by_username params[:username]

      if user
        #found successfully
        #session is a rails hash helper
        session[:user_id] = user.id
        session[:username] = user.username
        redirect_to works_path
        flash[:success] = "successfully logged as #{user.username}"

      else
        #did not find
        #or you could take an input and create a new author
        # flash.now[:error] = "#{user.username} not found"
        # render :login_form
        new_user = User.create(username: params[:username])
        session[:user_id] = new_user.id
        session[:username] = new_user.username
        redirect_to works_path
        flash[:success] = "successfully logged as #{new_user.username}"
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
