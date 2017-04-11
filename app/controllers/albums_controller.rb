class AlbumsController < ApplicationController
  def index
    @albums = Content.all.select { |c| c.category == "album"}
  end

  def show
  end
end
