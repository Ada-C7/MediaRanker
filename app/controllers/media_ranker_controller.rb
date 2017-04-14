class MediaRankerController < ApplicationController

  def index
    @albums = Work.where(category: "album").limit(10)
    @books = Work.where(category: "book").limit(10)
    @movies = Work.where(category: "movie").limit(10)

    @rand_work = Work.offset(rand(Work.count)).first
    if @rand_work.category == "album"
      @rand_work_path = album_path(@rand_work.id)
    elsif @rand_work.category == "book"
      @rand_work_path =  book_path(@rand_work.id)
    elsif @rand_work.category == "movie"
      @rand_work_path =  movie_path(@rand_work.id)
    else
      @rand_work_path =  root_path
    end
  end
end
