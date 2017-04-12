class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  # LOGIN

  def login_index
  end

  def create_login
  end


end
