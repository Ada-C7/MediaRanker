class BooksController < ApplicationController
  def index
    @books = Work.all.select {|work| work.category == "book"}
  end

  def new
    @book = Work.new
  end

  def create
    @book = Work.create work_params
    @book.category = "book"
    @book.save

    unless @book.id == nil
      redirect_to books_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year, :category)
  end
end
