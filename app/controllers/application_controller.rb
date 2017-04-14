class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  @works = Work.all
  @top_works = @works.sort_by {|work| work[:votes]}.reverse
  # @movies = Work.all.select {|work| work.category == "movie"}
  @movies = Work.where(category: "movie")
  @top_movies = @movies.sort_by {|movie| movie[:votes]}.reverse

  #  @books = Work.all.select {|work| work.category == "book"}
  @books = Work.where(category: "book")
  @top_books = @books.sort_by{|book| book[:votes]}.reverse
  #  @albums = Work.all.select {|work| work.category == "album"}
  @albums = Work.where(category: "album")
  # @top_albums = @albums.order(:votes)
  @top_albums = @albums.sort_by{|album| album[:votes]}.reverse

  @work_votes = Vote.where(work_id: params[:id])
  end
end
