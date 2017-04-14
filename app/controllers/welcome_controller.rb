class WelcomeController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
    @works = Work.all
    @media_spotlight = Work.top_work
  end
end
