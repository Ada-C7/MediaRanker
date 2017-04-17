class WorksController < ApplicationController
  # View media by category
  def movie_index
    @movies = Work.where(category: "movie")
  end

  def book_index
    @books = Work.where(category: "book")
  end

  def album_index
    @albums = Work.where(category: "album")
  end

  def new; end

  def show
    @work = Work.find(params[:id])
  end



end
