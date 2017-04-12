class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
  end

  def create
  end

  private
  def movie_params
    category_params
  end
end
