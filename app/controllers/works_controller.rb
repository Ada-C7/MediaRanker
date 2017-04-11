class WorksController < ApplicationController
  def index
    @works = Work.all
    @books = Work.where(mediatype: 'books')
    @movies = Work.where(mediatype: 'movie')
    @albums = Work.where(mediatype: 'album')
  end

  def mediatype_list
  end

  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

end
