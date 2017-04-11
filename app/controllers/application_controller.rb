class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
    @works = Work.all
    @books = @works.find_all { |work| work.category == "book" }
    @albums = @works.find_all { |work| work.category == "album" }
    @movies = @works.find_all { |work| work.category == "movie" }
  end

end
