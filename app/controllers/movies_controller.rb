class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
  end

  def new
    @movie = Work.new
  end

  def create
    @movie = Work.create movie_params
    if @movie.id != nil
      redirect_to movies_path
    else
      render "new"
    end
  end

  private
  def movie_params
    category_params
  end
end
