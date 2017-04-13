class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: 'movie')
  end

  def show
    @movie = Work.find(params[:id])
  end

  def new
  end
end
