class BooksController < ApplicationController
  def index
    @books = Work.where(category: "book")
  end

  def new
    @book = Work.new
  end

  def create
    @book = Work.create book_params
    if @book.id != nil
      redirect_to books_path
    else
      render "new"
    end
  end

  private
  def book_params
    category_params
  end
end
