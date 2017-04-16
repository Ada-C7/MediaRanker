class MoviesController < WorksController
  def index
    user_name
    @movies = Work.where(category:"movie").order(votes_count: :desc)
  end

  def new
    user_name
    @work = Work.new(category: "movie")
  end
end
