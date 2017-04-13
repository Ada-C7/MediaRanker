class HomeController < ApplicationController
  def index
    @works = {}
    @works["movies"] = Work.where(category: "movie").limit(10)
    @works["books"] = Work.where(category: "book").limit(10)
    @works["albums"] = Work.where(category: "album").limit(10)
    # @movies = Work.where(category: "movie").limit(10)
    # @books = Work.where(category: "book").limit(10)
    # @albums = Work.where(category: "album").limit(10)

    # @albums = Work.where(category: album).order(votes: :desc).limit(10)
    # Book.where(author: "Roxane Gay").order(title: :desc)
  end
end
