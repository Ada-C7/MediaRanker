class MoviesController < ApplicationController
  def index
    @movies = Work.movies
  end
end
