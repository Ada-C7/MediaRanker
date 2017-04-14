class AlbumsController < ApplicationController
  def index
    @albums = Work.where(category: "album")
  end

  def new
    @album = Work.new
  end

  def create
    @album = Work.create album_params
    @album.category = "album"
    @album.save

    if @album.id != nil
      flash[:success] = "Album added successfully"
      redirect_to albums_path
    else
      flash.now[:error] = "Error has occurred"
      render "new"
    end
  end

  private
  def album_params
    media_params
  end
end
