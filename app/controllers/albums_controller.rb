class AlbumsController < ApplicationController
  def index
    @albums = category_index("album")
  end

  def new
    @album = Work.new
  end

  def create
    @album = Work.create! work_params
    unless @album.id == nil
      redirect_to work_path(@album.id)
    else
      render "new"
    end
  end

end

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
end
