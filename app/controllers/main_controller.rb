class MainController < ApplicationController
  def index
    works = Work.all
    votes = works.map{|work| [work.id, work.votes.count]}.to_h
    spot_id = votes.key(votes.values.max)
    @spot = Work.find(spot_id)

    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")
    @albums = Work.where(category: "album")
  end
end
