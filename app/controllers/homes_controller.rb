class HomesController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @spotlight_work = Work.spotlight
  end
end
