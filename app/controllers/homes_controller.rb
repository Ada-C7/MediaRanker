class HomesController < ApplicationController
  def index
    user_name
    @movies = Work.where(category: "movie")
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @spotlight_work = Work.spotlight
  end
end
