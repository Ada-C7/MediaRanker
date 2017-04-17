class HomeController < ApplicationController
  def index
    @works = {}
    @works["movies"] = Work.top_ten("movie")
    @works["books"] = Work.top_ten("book")
    @works["albums"] = Work.top_ten("album")

    @spotlight = Work.spotlight
  end
end
