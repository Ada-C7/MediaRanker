class BooksController < ApplicationController
  def index
    @books = Work.books
  end

  def new
    @book = Work.new
  end

  def create
    if session[:user_id].nil?
      return redirect_to login_path
    end
    @book = Work.new
    @book.category = "book"
    @book.user_id = session[:user_id]
    @book.title = work_params[:title]
    @book.publication_year = work_params[:publication_year]
    @book.description = work_params[:description]

    if @book.valid?
      @book.save!
      redirect_to books_path
    else
      flash.now[:alert] = "Book is not added!"
      render "new", status: :bad_request
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
