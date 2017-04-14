class BooksController < ApplicationController
  def index
    @books = Work.books
  end
end
