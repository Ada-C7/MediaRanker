class HomeController < ApplicationController
  def index
    @works = {}
    @works["movies"] = Work.order_by_votes("movie").first(10)
    @works["books"] = Work.order_by_votes("book").first(10)
    @works["albums"] = Work.order_by_votes("album").first(10)

    @spotlight = Work.spotlight
  end
end
