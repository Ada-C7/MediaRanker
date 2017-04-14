class WelcomeController < ApplicationController
  def index
    @books = Work.books
    @movies = Work.movies
    @albums = Work.albums
    @spotlight = Work.spotlight
  end
end
