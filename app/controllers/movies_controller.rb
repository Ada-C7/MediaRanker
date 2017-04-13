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

  def update
    @movie = Content.find(params[:id])

    if @movie.update movie_params
      redirect_to movie_path
    else
      render "edit"
    end

  end



  private

  def movie_params
    params.require(:content).permit(:category, :title, :creator, :publication_year, :description)
  end
end
