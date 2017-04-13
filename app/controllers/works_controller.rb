class WorksController < ApplicationController
  def index
    @media_type = params[:media_type]
    @albums = Work.albums
    @books = Work.books
    @movies = Work.movies
  end

  def new
    @work = Work.new
  end

  def self.books

  end
end
