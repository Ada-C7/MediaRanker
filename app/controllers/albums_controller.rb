class AlbumsController < ApplicationController
  def index
    @albums = Content.albums
  end

  def show
      @album = Content.albums.find(params[:id])
  end
end
