class AlbumsController < ApplicationController
  def index
    @albums = Content.albums
  end

  def show
      @album = Content.find(params[:id])
  end
end
