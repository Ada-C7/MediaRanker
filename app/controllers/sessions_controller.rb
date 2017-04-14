class SessionsController < ApplicationController
  def login_form; end # this is to show an empty controller action (it's still doing the render)

    def login
      #raise
      user = User.find_by_name(params[:username])

      if user
        #found successfully
        #session is a rails hash helper
        flash[:success] = "successfully logged as #{user.username}"
        session[:user_id] = user.id
      else
        #did not find
        #or you could take an input and create a new author
        user = User.create(params[:username])
        flash.now[:success] = "successfully logged as #{user.username}"
        # render :login_form
      end

      redirect_to works_path
    end


    def logout
      #raise
      #session[:author_id]
      session.delete(:username)
      flash[:success] = "successfully logged out"
      redirect_to works_path

    end
end
