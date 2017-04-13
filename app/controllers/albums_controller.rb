class AlbumsController < ApplicationController

  def index
    @albums = Work.albums
  end

  def show
    @result_album = Work.find(params[:id])
  end
end
