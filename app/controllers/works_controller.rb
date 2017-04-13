class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def album_index
    @works = Work.where(category: "album")
  end

  def book_index
    @works = Work.where(category: "book")
  end

  def movie_index
    @works = Work.where(category: "movie")
  end

  def album_show
    @work = Work.find_by(category: "album", id: params[:id])
  end

  def movie_show
    @work = Work.find_by(category: "movie", id: params[:id])
  end

  def book_show
    @work = Work.find_by(category: "book", id: params[:id])
  end

  def new
    @work = Work.new(params[:id])
  end

  def create
    @work = Work.create(work_params)

    if @work.id != nil
      flash[:success] = "Success! Added to the list."
      redirect_to works_path
    else
      flash[:success] = "It didn't work, try again?"
      render :new
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path
  end

  def delete
    @work = Work.find(params[:id])
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to works_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :description, :pub_date)
  end
end
