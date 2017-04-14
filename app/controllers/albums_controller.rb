class AlbumsController < ApplicationController
  def index
    @albums = Work.albums
  end
end
