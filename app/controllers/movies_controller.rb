class MoviesController < ApplicationController
  def index
    @works = Work.where(category: "movie")
  end
end
