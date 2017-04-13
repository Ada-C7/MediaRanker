class MoviesController < WorksController
  def index
    @movies = Work.where(category:"movie")
  end
end
