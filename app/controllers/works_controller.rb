class WorksController < ApplicationController

  def movies
    # @movies =
  end

  def books
  end

  def alubms
  end
  #
  def new_movie
    @work = Work.new
    @work.category = "movie"
    render "works/movies/new"
  end

  def new_book
    @work = Work.new
    @work.category = "book"
    render "works/books/new"
  end

  def new_album
    @work = Work.new
    @work.category = "album"
    render "works/albums/new"
  end

  def create
    @work = Work.new(works_params)

    if @work.save # is true - IE validations pass
      redirect_to find_path(@work)
    else # We know the validations didn't pass so want to show messages
      if @work.category == "movie"
        render "works/movies/new", status: :bad_request
      elsif @work.category == "book"
        render "works/books/new", status: :bad_request
      elsif @work.category == "album"
        render "works/albums/new", status: :bad_request
      end
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(works_params)

    redirect_to work_path(@work.id)
  end

  def destroy
    work = Work.find(params[:id])
    path = find_path(work)
    Work.find(params[:id]).destroy
    redirect_to path
  end

private
  def works_params
    return params.required(:work).permit(:category,
                                         :title,
                                         :creator,
                                         :publication_year,
                                         :description)
  end

  def find_path(work)
    if work.category == "movie"
      return movies_path
    elsif work.category == "book"
      return books_path
    elsif work.category == "album"
      return albums_path
    end
  end

end
