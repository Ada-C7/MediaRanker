class WorksController < ApplicationController
  def index
    @movies = Work.movies
  end
end
