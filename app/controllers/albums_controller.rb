class AlbumsController < ApplicationController
  def index
    @works = Work.where(category: "album")
  end

  def new
    @work = Work.new
    @work.category = "album"
  end
end
