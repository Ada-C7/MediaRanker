class WorksController < ApplicationController

  def edit
    @work = Work.find(params[:id])
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
    @album = Work.new(strong_params)
    @album.category = "album"
    if @album.save
      redirect_to root_path #Change to albums
    else
      render :new
    end
  end

  def new_album
    @album = Work.new
  end

  # MOVIES

  def movies_index
    @movies = Work.where(category: "movie")

  end

  def create_movie
    @movie = Work.new(strong_params)
    @movie.category = "movie"
    if @movie.save
      redirect_to root_path #Change to movies
    else
      render :new
    end
  end

  def new_movie
    @movie = Work.new
  end

  # BOOKS

  def books_index
    @books = Work.where(category: "book")
  end

  def create_book
    @book = Work.new(strong_params)
    @book.category = "book"
    if @book.save
      redirect_to root_path #Change to book
    else
      render :new
    end
  end

  def new_book
    @book = Work.new
  end

  private

  def strong_params
    return params.permit(:title, :creator, :publication_year, :description)
  end
end
