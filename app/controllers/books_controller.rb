class BooksController < ApplicationController
  def index
    @books = Work.where(category: "book")
  end

  def new
    @book = Work.new
  end

  def create
    @book = Work.create book_params
    @book.category = "book"
    @book.save

    if @book.id != nil
      flash[:success] = "Album added successfully"
      redirect_to books_path
    else
      flash.now[:error] = "Error has occurred"
      render "new"
    end
  end

  private
  def book_params
    work_params
  end
end
