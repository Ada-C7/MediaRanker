class WorksController < ApplicationController
  def index
    @spotlight_work = Work.all.sample
    @movies = Work.where(category: "movie")[0..9]
    @books = Work.where(category: "book")[0..9]
    @albums = Work.where(category: "album")[0..9]
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :description, :creator, :publication_year)
  end

end
