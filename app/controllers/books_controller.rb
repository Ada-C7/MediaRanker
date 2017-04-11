class BooksController < ApplicationController
  def index
    @books = category_index("book")

  end
end
