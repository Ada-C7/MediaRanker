class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :lookup_user

  # <section class="flash">
  # <% flash.each do |name, message| %>
  # <div class="">
  # <%= name %>">
  # <%= message %>
  # </div>
  # <% end %>
  # </section>


  private
  def lookup_user
    unless session[:user_id].nil?
      @user =User.find_by(id: session[:user_id])
    end
  end


  def require_login
    lookup_user
    if @current_user.nil?
      flash[:message] = "You must be logged in to see that."
      #in a before_action filter, this will prevent
      #the action from running at all
      redirect_to root_path
    end
  end



end
