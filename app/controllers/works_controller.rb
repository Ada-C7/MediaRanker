class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")

    @spotlight = Work.all.sample
  end

  def show
    @work = Work.find_by_id(params[:id])

  end
end
