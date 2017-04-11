class WorksController < ApplicationController
  def index_album
    @albums = Work.where(category: "album")
  end

  def index_movie
    @movies = Work.where(category: "movie")
  end

  def index_book
    @book = Work.where(category: "book")
  end

  def show
    @result_work = Work.find_by_id(params[:id])
    if !@result_work
      render_404
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

  end

end
