class VotesController < ApplicationController
  def index
    @user = User.all
  end

  def new
    @user = User.new(params[:id])
  end

  def create
    @user = User.create(params[:id])
  end
end
