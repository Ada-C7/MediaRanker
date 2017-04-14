class MoviesController < WorksController
  def index
    @movies = Work.where(category:"movie")
  end

  def new
    @work = Work.new(category: "movie")
  end
end
