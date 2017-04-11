class AlbumsController < ApplicationController
  def index
    @albums = category_index("album")
  end
end
