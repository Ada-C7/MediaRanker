class WelcomeController < ApplicationController
  def index
    @top_albums = Work.where(category: "album")
    @top_books = Work.where(category: "movie")
    @top_movies = Work.where(category: "book")
  end
end
