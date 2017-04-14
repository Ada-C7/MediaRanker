class MainController < ApplicationController
  def index
    @work_category = "Work"
    works = Work.all
    votes = works.map{|work| [work.id, work.votes.count]}.to_h
    spot_id = votes.key(votes.values.max)
    @spot = Work.find(spot_id)

    @books = Work.where(category: "book")
    @books = @books.sort_by{|book| book.votes.count}.reverse

    @movies = Work.where(category: "movie")
    @movies = @movies.sort_by{|movie| movie.votes.count}.reverse

    @albums = Work.where(category: "album")
    @albums = @albums.sort_by{|album| album.votes.count}.reverse

  end
end
