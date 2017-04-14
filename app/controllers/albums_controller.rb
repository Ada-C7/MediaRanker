class AlbumsController < ApplicationController
  def index
    @works = Work.where(category: "album")
  end

  def show
    @work = Work.find(params[:id])
  end

end
