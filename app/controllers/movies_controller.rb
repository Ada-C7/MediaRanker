class MoviesController < ApplicationController
  def index
    @works = Work.where(category: "movie")
  end

  def new
    @work = Work.new
    @work.category = "movie"
  end
end
