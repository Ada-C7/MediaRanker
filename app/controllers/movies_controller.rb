class MoviesController < ApplicationController
  def index
    @movies = category_index("movie")
  end

  def new
    @movie = Work.new
  end

  def create
    @movie = Work.create! work_params
    unless @movie.id == nil
      redirect_to work_path(@movie.id)
    else
      render "new"
    end
  end

end


private

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
end
