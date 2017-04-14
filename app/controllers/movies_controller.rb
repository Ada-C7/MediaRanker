class MoviesController < WorksController
  def index
    user_name
    @movies = Work.where(category:"movie")
  end

  def new
    user_name
    @work = Work.new(category: "movie")
  end
end
