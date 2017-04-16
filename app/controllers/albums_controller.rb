class AlbumsController < WorksController

  def index
    user_name
    @albums = Work.where(category: "album").order(votes_count: :desc)
  end

  def new
    user_name
    @work = Work.new(category: "album")
  end
end
