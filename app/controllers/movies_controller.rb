class MoviesController < ApplicationController
  def index
    @movies = Content.movies
  end

  def show
    @movie = Content.find(params[:id])
  end
end
