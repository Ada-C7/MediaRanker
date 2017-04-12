class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  @works = Work.all
  @movies = Work.all.select {|work| work.category == "movie"}
  @books = Work.all.select {|work| work.category == "book"}
  @albums = Work.all.select {|work| work.category == "album"}
  end
end
