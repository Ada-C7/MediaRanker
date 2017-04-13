class BooksController < ApplicationController
  def index
    @books = Content.books
  end

  def show
    @book = Content.find(params[:id])
  end
end
