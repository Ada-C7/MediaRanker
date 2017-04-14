class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index
  @works = Work.all
  @top_works = @works.sort_by {|work| work[:vote_count]}.reverse

  @movies = Work.where(category: "movie")
  @top_movies = @movies.sort_by {|movie| movie[:vote_count]}.reverse

  @books = Work.where(category: "book")
  @top_books = @books.sort_by{|book| book[:vote_count]}.reverse

  @albums = Work.where(category: "album")
  @top_albums = @albums.sort_by{|album| album[:vote_count]}.reverse
  end
end
