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

  it "category_sorted('movie') returns a group of movies" do
    movies = Work.category_sorted("movie")

    movies.first.category.must_equal "movie"
    movies.last.category.must_equal "movie"
  end

  it "category_sorted('album') returns a group of albums" do
    albums = Work.category_sorted("album")

    albums.first.category.must_equal "album"
    albums.last.category.must_equal "album"
  end

  it "category_sorted('book') returns a group of books" do
    books = Work.category_sorted("book")

    books.first.category.must_equal "book"
    books.last.category.must_equal "book"
  end

  it "category_sorted movies returns all movies" do
    movie_count = Work.where(category: "movie").count
    Work.category_sorted("movie").count.must_equal movie_count
  end

  it "category_sorted albums returns all albums" do
    album_count = Work.where(category: "album").count
    Work.category_sorted("album").count.must_equal album_count
  end

  it "category_sorted books returns all books" do
    book_count = Work.where(category: "book").count
    Work.category_sorted("book").count.must_equal book_count
  end

  it "top_ten movies returns movies" do
    movies = Work.top_ten("movie")

    movies.first.category.must_equal "movie"
    movies.last.category.must_equal "movie"
  end

  it "top_ten books returns movies" do
    books = Work.top_ten("book")

    books.first.category.must_equal "book"
    books.last.category.must_equal "book"
  end

  it "top_ten albums returns albums" do
    albums = Work.top_ten("album")

    albums.first.category.must_equal "album"
    albums.last.category.must_equal "album"
  end

  it "if more than 10 movies, top_ten movies returns 10 movies" do
    movies = Work.top_ten("movie")
    movies.count.must_equal 10
  end

  it "if less than 10 albums, top_ten returns all albums" do
    albums = Work.top_ten("album")

    albums.first.category.must_equal "album"
    albums.last.category.must_equal "album"
    albums.count.must_equal Work.category_sorted("album").count
  end

  it "top_ten movie with the most votes gets sorted first" do
    most_votes_movie = works(:most_votes_movie).title
    top_movie = Work.top_ten("movie").first.title

    top_movie.must_equal most_votes_movie
  end

  it "first top_ten movie has more votes than last" do
    first_movie = Work.top_ten("movie").first
    last_movie = Work.top_ten("movie").last

    first_movie.votes_count.must_be :>=, last_movie.votes_count
  end

  it "top_ten books returns an empty array if there are no books" do
    works(:bone_people).destroy
    works(:most_votes_overall).destroy

    Work.top_ten("book").must_equal []
  end

  it "spotlight work has the most votes" do
    spotlight = Work.spotlight
    spotlight.votes_count.must_equal works(:most_votes_overall).votes_count
  end

  it "a work has_many votes" do
    libertine_votes = works(:libertines).votes

    libertine_votes.first.class.must_equal Vote
    libertine_votes.last.class.must_equal Vote
  end

  it "libertines album has correct number of votes" do
    works(:libertines).votes.count.must_equal 4
  end

  it "a work with no votes returns an empty array" do
    works(:graduate).votes.must_equal []
  end
end
