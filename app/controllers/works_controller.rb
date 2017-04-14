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

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)

    if @work.id != nil
      flash[:success] = "Success! Added to the list."
      redirect_to works_path
    else
      flash[:failure] = "It didn't work, try again?"
      render :new, status: :bad_request
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def update
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      work.assign_attributes(work_params)
      if work.save
        redirect_to work_path(work)
      else
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      work.destroy
      redirect_to works_path
    end
  end

  def vote
    @vote = Vote.create(user_id: session[:user_id], work_id: params[:id])

    if @vote
      flash[:success] = "Vote Added!"
      redirect_to user_path(session[:user_id])
    end
  end

  def max_vote
  end

  private

  def work_params
    return params.require(:work).permit(:title, :category, :creator, :description, :pub_date)
  end
end
