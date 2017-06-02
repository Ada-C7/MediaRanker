require "test_helper"

describe Work do
  let(:work) { Work.new }

  # must have a title
  it "cannot create a work without a title" do
    work.valid?.must_equal false
  end

  # must have a published
  it "cannot create a work without a published" do
    work.title = "bolivia"
    work.valid?.must_equal false
  end

  # must have a description
  it "cannot create a work without a description" do
    work.title = "bolivia"
    work.published = "1985"
    work.valid?.must_equal false
  end

  # must have a category
  it "cannot create a work without a category" do
    work.title = "bolivia"
    work.published = "1985"
    work.description = "A lot of stuff about south america."
    work.valid?.must_equal false
  end

  # category must be "movie", "book", or "album"
  it "category must be movie, book, or album" do
    work.title = "bolivia"
    work.published = "1985"
    work.description = "A lot of stuff about south america."
    work.category = "movie"
    work.valid?.must_equal true
    work.category = "book"
    work.valid?.must_equal true
    work.category = "album"
    work.valid?.must_equal true
    work.category = "poo"
    work.valid?.must_equal false
    work.category = 0
    work.valid?.must_equal false
    work.category = nil
    work.valid?.must_equal false
  end

  # must be able to create new work
  it "must be able to create new work" do
    work = Work.new(title: "big stuff", published: 1986, description: "Some stuff here.", category: "movie")
    work.valid?.must_equal true
  end

  ## not testing counter cache functionality

  # testing self.top_ten(category)
  it "returns the top ten votes works for album" do
    top_albums = Work.top_ten("album")
    top_albums.length.must_equal 2
  end

  it "album return is sorted by votes" do
    top_albums = Work.top_ten("album")
    top_albums.first.must_equal works(:okcomputer)
  end
  #
  it "returns the top ten votes works for movie" do
    top_movies = Work.top_ten("movie")
    top_movies.length.must_equal 2
  end

  it "movie return is sorted by votes" do
    top_movies = Work.top_ten("movie")
    top_movies.first.must_equal works(:fall)
  end
  #
  it "returns the top ten votes works for book" do
    top_books = Work.top_ten("book")
    top_books.length.must_equal 2
  end

  it "book return is sorted by votes" do
    top_books = Work.top_ten("book")
    top_books.first.must_equal works(:linnets)
  end

  # # testing self.max_votes - should be works(:fall)
  it "returns work with max votes" do
    max_votes = Work.max_votes
    max_votes.must_equal works(:fall)
  end

  it "sorts for work created first if tie in max_votes" do
    Vote.create(user: users(:dog), work: works(:okcomputer))

    max_votes = Work.max_votes
    max_votes.must_equal works(:fall)
  end

  # a work has many votes
  it "a work has many votes" do
    votes = works(:telling).votes
    votes.first.user.username.must_equal "felixbenjamin"
  end

end
