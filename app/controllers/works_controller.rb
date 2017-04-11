class WorksController < ApplicationController
  def index
    @movies = Work.movies
    @albums = Work.albums
    @books = Work.books
  end
end
