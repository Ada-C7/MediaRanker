class BooksController < ApplicationController
  def index
    @books = Work.books
  end

  def new
    @book = Work.new
  end

  def create
    work = Work.new
    work.category = "book"
    work.user_id = session[:user_id]
    work.title = work_params[:title]
    work.publication_year = work_params[:publication_year]
    work.description = work_params[:description]

    work.save!
    redirect_to books_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
