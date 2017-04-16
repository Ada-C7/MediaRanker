class HomesController < ApplicationController
  def index
    user_name
    @movies = Work.where(category: "movie").order(votes_count: :desc)
    @albums = Work.where(category: "album").order(votes_count: :desc)
    @books = Work.where(category: "book").order(votes_count: :desc)
    @spotlight_work = Work.spotlight
  end
end
