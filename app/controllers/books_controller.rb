class BooksController < ApplicationController
  def index
    @books = Work.where(mediatype: 'book')
  end
end
