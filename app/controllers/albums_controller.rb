class AlbumsController < ApplicationController
  def index
    @albums = Work.where(category: "album")
  end
end
