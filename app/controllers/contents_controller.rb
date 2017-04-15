class ContentsController < ApplicationController
  def index
    albums = Content.albums
    @albums = Content.sort_votes(albums)
    books = Content.books
    @books = Content.sort_votes(books)
    movies = Content.movies
    @movies = Content.sort_votes(movies)

    all = Content.all
    all = Content.sort_votes(all)
    @spotlight = all[0]
  end
end
