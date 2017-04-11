require "test_helper"

describe Work do
  # let(:work) { Work.new }
  #
  # it "must be valid" do
  #   value(work).must_be :valid?
  # end
  let(:work) { Work.new }

  it 'must be created with every field populated' do
    result = work.valid?
    result.must_equal false

    work.errors.messages.must_include :title && :by && :year && :descrition && :media_type
  end

  it 'must return all books with Work#books' do
    Work.books.each do |book|
      book.media_type.must_equal 'book'
    end
  end

  it 'must return all albums with Work#albums' do
    Work.albums.each do |album|
      album.media_type.must_equal 'album'
    end
  end

  it 'must return all movies with Work#movies' do
    Work.movies.each do |movie|
      movie.media_type.must_equal 'movie'
    end
  end
end
