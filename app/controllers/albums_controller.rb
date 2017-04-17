class AlbumsController < ApplicationController
  def index
    @albums = Content.albums
  end

  def new
    @album = Content.new
  end

  def create
    album = Content.new album_params
    album[:category] = "album"
    album.save

    if album.save
      redirect_to albums_path
    end

  end

  def show
      @album = Content.find(params[:id])
  end

  def edit
    @album = Content.find(params[:id])
  end

  def update
    @album = Content.find(params[:id])

    if @album.update album_params
      redirect_to album_path
    else
      render "edit"
    end
  end

  def destroy
    Content.destroy(params[:id])

    redirect_to albums_path
  end

  private

  def album_params
    params.require(:content).permit(:category, :title, :creator, :publication_year, :description)

  end

end
