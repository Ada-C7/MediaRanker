class ContentsController < ApplicationController
  def index
    @albums = Content.albums
    @books = Content.books
    @movies = Content.movies
  end
end
