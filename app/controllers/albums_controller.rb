class AlbumsController < ApplicationController
  def index
    @albums = Work.where(category: "album")
  end

  def new
    @album = Work.new
  end

  def create
    @album = Work.create album_params
    # wait... all this info should be from works..right?
    if @album.id != nil
      redirect_to albums_path
    else
      render "new"
    end
  end

  private
  def album_params
    category_params
  end
end
