class MoviesController < ApplicationController
  def index
    @movies = category_index("movie")

  end
end
