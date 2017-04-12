require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  def login_form; end


  def login
    #raise
    user = User.find_by_name(params[:name])

    if author
      #logic for found
      session[:user_id] = user.id
      flash[:success] = "Hello, #{ user.name }!"
      redirect_to root_path
    else
      #did not find
      flash.now[:error] = "Pal, I looked, but I couldn't find your user name."
      render :login_form #in this case, this is the same as render "new"
    end
  end

  def logout
    #session[:author_id] = nil
    session.delete[:user_id]
    flash[:success] = "You are successfully logged out."
    redirect_to root_path
  end


end
