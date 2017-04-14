class WelcomeController < ApplicationController
  def index
    @works = Work.all
    @movies = Work.gather_movies
    @books = Work.gather_books
    @albums = Work.gather_albums
  end
end
