class MoviesController < ApplicationController
  def index
    @movies = Work.where(category: "movie")
  end
end
