class WelcomeController < ApplicationController
  def index
    @top_albums = Work.where(category: "album")
    @top_books = Work.where(category: "book")
    @top_movies = Work.where(category: "movie")
    # @spotlight_work = Work.votes.order("votes DESC").first
  end
end
