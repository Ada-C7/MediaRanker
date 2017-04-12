class MoviesController < ApplicationController
  def index
    @movies = Work.all.select {|work| work.category == "movie"}
  end

  def new
    @movie = Work.new
  end

  def create
    @movie = Work.create work_params
    @movie.category = "movie"
    @movie.save

    unless @movie.id == nil
      redirect_to movies_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year, :category)
  end
end
