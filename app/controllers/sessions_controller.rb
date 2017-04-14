class SessionsController < ApplicationController


  def login_form; end

  def login
    user = User.find_by_name(params[:name])
    #returns nil if not found
    if user
      # found successfuly

      session[:user_id] = user.id
      flash[:success] = "Successfully logged in as existing user #{user.name}"
      redirect_to root_path
    else
      # did not find
      user = User.create(name: (params[:name]))
      session[:user_id] = user.id
      flash[:success] = "Successfully created new user #{user.name}  with ID #{user.id}"
      redirect_to root_path
    end
  end


  def logout
    session[:user_id] = nil
    flash[:success] = "Successfully logged out"
    redirect_to root_path
  end



end
