class BooksController < ApplicationController
  def index
    @books = Work.all.select {|work| work.category == "book"}
    @books.sort_by{|book| book[:votes]}.reverse
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

  def edit
    @book = Work.find(params[:id])
  end

  def update
    raise
      book = Work.find(params[:id])

      book.title = work_params[:title]
      book.creator = work_params[:creator]

      book.description = work_params[:description]

      if book.save
        redirect_to root_path
      else
        render "edit"
      end
  end
  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year, :category)
  end
end
