require "test_helper"

describe Work do
  describe 'validations' do
    let(:work) { Work.new }
    it 'must be created with a title field' do
      result = work.valid?
      result.must_equal false

      work.errors.messages.must_include :title
    end
  end

  describe 'methods' do
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
end
