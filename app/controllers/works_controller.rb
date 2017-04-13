class WorksController < ApplicationController

  def edit
  end

  def show
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
    end
  end

  def update
  end

  def destroy
  end

  # ALBUMS

  def albums_index
    @albums = Work.where(category: "album")
  end

  def create_album
  end

  def new_album
  end

  # MOVIES

  def movies_index
  end

  def create_movie
  end

  def new_movie
  end

  # BOOKS

  def books_index
  end

  def create_book
  end

  def new_book
  end
end
