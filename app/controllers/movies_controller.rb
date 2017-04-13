class MoviesController < ApplicationController
  def index
    @movies = Content.movies
  end

  def show
    @movie = Content.find(params[:id])
  end

  def edit
    @movie = Content.find(params[:id])
  end



  private

  def movie_params
    params.require(:content).permit(:category, :title, :creator, :publication_year, :description)
  end
end
