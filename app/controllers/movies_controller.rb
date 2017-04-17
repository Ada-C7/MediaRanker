class MoviesController < ApplicationController
  def index
    @movies = Work.movies
  end

  def show
    @result_movie = Work.find(params[:id])
  end

  def edit
    @movie = Work.find(params[:id])
  end

  def update
    @movie = Work.find(params[:id])

    @movie.title = movie_params[:title]
    @movie.creator = movie_params[:creator]
    @movie.pub_year = movie_params[:pub_year]
    @movie.description = movie_params[:description]

    if @movie.save
      redirect_to movie_path(@movie.id)
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to movies_path
  end

  def create
    @movie = Work.create movie_params

    if @movie.id != nil
      redirect_to movies_path
    else
      render "new"
    end
  end

  def new
    @work = Work.new(:category => "movie")

    render template: "works/new"
  end

  private

  def book_params
    params.require(:movie).permit(:title, :creator, :pub_year, :description)
  end


end
