class WelcomeController < ApplicationController
  def index
    album_vote_hash = Work.where(category: "album").joins(:votes).group("works.id").count
    album_vote_array = album_vote_hash.to_a
    @albums = album_vote_array.sort_by {|work, votes| -votes}[0..9]
    @albums.map! {|album| Work.find(album[0])}
    @books = Work.where(category: "book").limit(10)
    @movies = Work.where(category: "movie")
    @works = Work.all
    @media_spotlight = Work.top_work
  end
end
