class WelcomeController < ApplicationController
  def index
    @books = Work.books.top
    @movies = Work.movies.top
    @albums = Work.albums.top
    @spotlight = Work.spotlight
  end
end
