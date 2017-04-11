class WorksController < ApplicationController

  def index
    @works = Work.all
    @books = @works.find_all { |work| work.category == "book" }
    @albums = @works.find_all { |work| work.category == "album" }
    @movies = @works.find_all { |work| work.category == "movie" }
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def edit
    @work = Work.find(params[:id])
  end

end
