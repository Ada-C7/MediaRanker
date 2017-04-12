class AlbumsController < ApplicationController
  def index_movie
    @movies = Work.where(category: "movie")
  end
end
