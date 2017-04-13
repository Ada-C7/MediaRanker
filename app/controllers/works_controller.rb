class WorksController < ApplicationController
  def index
    media_type = params[:media_type]
    case media_type
    when 'movies'
      @works = Work.movies
    when 'books'
      @works = Work.books
    when 'albums'
      @works = Work.albums
    end
  end

  def new
    @work = Work.new
  end
end
