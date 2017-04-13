class AlbumsController < WorksController

  def index
    @albums = Work.where(category: "album")
  end

  def new
    @work = Work.new(category: "album")
  end
end
