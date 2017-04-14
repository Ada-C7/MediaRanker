class BooksController < ApplicationController
  def index
    @works = Work.where(category: "book")
  end

  def show
    @work = Work.find(params[:id])
  end

  def new
    @book = Work.new
  end

  def create
    user_params = work_params
    controller_params = {category: "book"}
    final_params = user_params.merge(controller_params)
    @work = Work.new(final_params)
    if @work.save
      redirect_to books_path
    else
      render :new
    end
  end

private
  def work_params
    return params.require(:work).permit(:title, :creator, :publication_year, :description)
  end

end
