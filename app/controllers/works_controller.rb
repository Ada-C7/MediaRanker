class WorksController < ApplicationController
  def index
    @works = Work.all
    @albums = Work.show_category("album")
    @books = Work.show_category("book")
    @movies = Work.show_category("movie")
  end

def books_index
  @books = Work.show_category("book")
end

def albums_index
  @albums = Work.show_category("album")
end

def movies_index
  @movies = Work.show_category("movie")
end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.save
    if @work.save
      redirect_to works_path
    else
      render :new, status: :bad_request
      flash[:failure] = "Could not save your item"
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
    @votes = @work.user_votes
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work =Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy_all
    redirect_to works_path
  end

  def vote
    works_vote = Vote.create!(user_id: session[:user_id], work_id:params[:id])

    if works_vote
      flash[:success] = "Your vote has been recorded!"
      redirect_to work_path(params[:id])
    end

  end

  private

  def work_params
    return params.require(:work).permit(:title, :created_by, :published, :description, :category)
  end
end
