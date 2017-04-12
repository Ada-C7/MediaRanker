require "test_helper"

describe Work do
  let(:work) { Work.new }

  it "can create a valid work" do
    work.title = "Swiss Army Man"
    work.creator = "The Daniels"
    work.year_published = 2016
    work.description = "I have a lot of questions about all the things you just said."
    work.category = "movie"

    work.must_be :valid?
  end

  it "works require a title" do
    work = works(:no_title)

    work.valid?
    work.errors.messages.must_include :title
  end

  it "if a title is given, the title field passes validation" do
    work.title = "Everything Is Illuminated"

    work.valid?
    work.errors.messages[:title].must_be :empty?
  end

  it "can't create work with with blank title" do
    work.title = ""

    work.valid?
    work.errors.messages.must_include :title
  end

  it "works require a category" do
    work = works(:no_category)

    work.valid?
    work.errors.messages.must_include :category
  end

  it "category must be either 'movie', 'book', or 'album'" do
    bad_work = works(:bad_category)
    movie = works(:graduate)
    book = works(:bone_people)
    album = works(:libertines)

    bad_work.valid?
    bad_work.errors.messages.must_include :category

    movie.valid?
    movie.errors.messages[:category].must_be :empty?

    book.valid?
    book.errors.messages[:category].must_be :empty?

    album.valid?
    album.errors.messages[:category].must_be :empty?
  end

  it "movies returns a group of movies" do
    movies = Work.movies

    movies.first.category.must_equal "movie"
    movies.last.category.must_equal "movie"
  end

  it "albums returns a group of albums" do
    albums = Work.albums

    albums.first.category.must_equal "album"
    albums.last.category.must_equal "album"
  end

  it "books returns a group of books" do
    books = Work.books

    books.first.category.must_equal "book"
    books.last.category.must_equal "book"
  end
end
