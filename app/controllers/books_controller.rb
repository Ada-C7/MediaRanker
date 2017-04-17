class BooksController < ApplicationController
  def index
    @books = category_index("book")
  end


  def new
    @book = Work.new
  end

  def create
    @book = Work.create! work_params
    unless @book.id == nil
      redirect_to books_path
    else
      render "new"
    end
  end

end


private

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publication_year)
end
