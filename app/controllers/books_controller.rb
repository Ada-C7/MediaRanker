class BooksController < ApplicationController
  def index
    @books = Content.books
  end

  def show
    @book = Content.find(params[:id])
  end

  def edit
    @book = Content.find(params[:id])
  end

  def update
    @book = Content.find(params[:id])

    if @book.update book_params
      redirect_to book_path
    else
      render "edit"
    end
  end

  def new
    @book = Content.new
  end

  def create
    book = Content.new book_params
    book[:category] = "book"
    book.save

    if book.save
      redirect_to books_path
    end

  end

  def destroy
    Content.destroy(params[:id])

    redirect_to books_path
  end

  private

  def book_params
    params.require(:content).permit(:category, :title, :creator, :publication_year, :description)
  end

end
