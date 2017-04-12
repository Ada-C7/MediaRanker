class MoviesController < ApplicationController
  def index
    @movies = Work.where(mediatype: 'movie')
  end
end
