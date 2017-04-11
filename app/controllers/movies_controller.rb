class MoviesController < ApplicationController
  def index
    @movies = Work.all.select {|work| work.category == "movie"}
  end
end
