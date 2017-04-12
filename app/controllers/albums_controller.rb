class AlbumsController < ApplicationController
  def index
    @works = Work.where(category: "album")
  end
end
