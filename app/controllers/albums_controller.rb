class AlbumsController < ApplicationController
  def index
    @albums = Work.where(mediatype: 'album')
  end
end
