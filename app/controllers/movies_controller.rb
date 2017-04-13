class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: 'movie')
  end

  def new
    @movie = Work.find(params[:id])
  end

  def show
  end
end
