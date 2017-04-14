class AlbumsController < WorksController

  def index
    user_name
    @albums = Work.where(category: "album")
  end

  def new
    user_name
    @work = Work.new(category: "album")
  end
end
