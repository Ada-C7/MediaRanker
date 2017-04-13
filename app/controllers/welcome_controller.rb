class WelcomeController < ApplicationController

  def index
    @works = Work.all
    @albums = Work.where(category: "album")
    @movies = Work.where(category: "movie")
    @books = Work.where(category: "book")
  end

end
