class BooksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(books_params)
    if @work.save
      redirect_to books_path
    else
      render :new
    end
  end

private
  def book_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end

end
