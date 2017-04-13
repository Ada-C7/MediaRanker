class BooksController < ApplicationController
  def index
    @books = Content.books
  end

  def show
  end
end
