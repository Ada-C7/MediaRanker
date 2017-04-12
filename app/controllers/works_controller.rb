class WorksController < ApplicationController
  def index
  end

  def albums
    @works = Work.where(category: "album")
    render "category"
  end

  def books
    @works = Work.where(category: "book")
    render "category"
  end

  def movies
    @works = Work.where(category: "movie")
    render "category"
  end

end
