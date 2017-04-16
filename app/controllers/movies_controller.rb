class MoviesController < ApplicationController
  def index
    @movies = Work.movies
  end

  def new
    @movie = Work.new
  end

  def create
    if session[:user_id].nil?
      return redirect_to login_path
    end
    @movie = Work.new
    @movie.category = "movie"
    @movie.user_id = session[:user_id]
    @movie.title = work_params[:title]
    @movie.publication_year = work_params[:publication_year]
    @movie.description = work_params[:description]

    if @movie.valid?
      @movie.save!
      redirect_to movies_path
    else
      flash.now[:alert] = "Movie is not added!"
      render "new", status: :bad_request
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
