class BooksController < ApplicationController
  def index
    @books = Content.books
  end

  def show
    @book = Content.find(params[:id])
  end

  def destroy
    Content.destroy(params[:id])

    redirect_to books_path
  end

  private

  def book_params
  end

end
