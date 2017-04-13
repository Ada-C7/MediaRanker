class AlbumsController < ApplicationController

  def index
    @albums = Work.albums
  end

  def show
    @result_album = Work.find(params[:id])
  end

  def edit
    @album = Work.find(params[:id])
  end

  def update
    @album = Work.find(params[:id])

    @album.title = album_params[:title]
    @album.creator = album_params[:creator]
    @album.pub_year = album_params[:pub_year]
    @album.description = album_params[:description]

    if @album.save
      redirect_to album_path(@album.id)
    else
      render "edit"
    end
  end

  def destroy
    Work.destroy(params[:id])

    redirect_to albums_path
  end

  def create
    @album = Work.create album_params

    if @album.id != nil
      redirect_to albums_path
    else
      render "new"
    end
  end

  def new
    @album = Album.new
  end

  private

    def album_params
      params.require(:album).permit(:title, :creator, :pub_year, :description)
    end


end
