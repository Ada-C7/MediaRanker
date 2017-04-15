require "test_helper"

describe Content do
  let(:content) { Content.new }

  it "you can create new Content" do
    content.category = "book"
    content.title = "Test Book"
    content.creator = "Me"
    content.publication_year = "2009"
    content.description = "This be test"

    content.valid?.must_equal true
  end

  it "category must be valid" do
    contents(:invalid_category).valid?.must_equal false
    contents(:shrek).valid?.must_equal true
  end

  it "must have a title" do
    contents(:no_title).valid?.must_equal false
    contents(:shrek).valid?.must_equal true

  end

  it "must have a creator" do
    contents(:no_creator).valid?.must_equal false
    contents(:shrek).valid?.must_equal true
  end

  it "must have a publication_year" do
    contents(:no_year).valid?.must_equal false
    contents(:shrek).valid?.must_equal true
  end

  it "self.albums returns an array of albums" do
    albums = Content.albums
    albums.each do |a|
      a.category.must_equal "album"
    end
  end

  it "self.movies returns an array of movies" do
    movies = Content.movies
    movies.each do |m|
      m.category.must_equal "movie"
    end
  end

  it "self.books returns an array of books" do
    books = Content.books
    books.each do |b|
      b.category.must_equal "book"
    end
  end

  it "should have votes associated with it" do
    proc {
    contents(:shrek).votes.create
    }.must_change 'contents(:shrek).votes.length', 1
   end

  it "self.sort_votes returns a sorte array of votes for a category" do
    movies = Content.movies
    movies = Content.sort_votes(movies)
    movies[0].title.must_equal "Shrek"
  end

end
