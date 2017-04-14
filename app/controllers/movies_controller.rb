class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
  end

  def new
    @movie = Work.new
  end

  def create
    @movie = Work.create movie_params
    @movie.category = "movie"
    @movie.save

    if @movie.id != nil
      flash[:success] = "Album added successfully"
      redirect_to movies_path
    else
      flash.now[:error] = "Error has occurred"
      render "new"
    end
  end

  private
  def movie_params
    media_params
    # params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end
end
