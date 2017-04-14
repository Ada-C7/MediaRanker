class WorksController < ApplicationController
  def index
    @works = Work.by_category(params[:category].singularize)
  end
  def show
    @work = Work.find(params[:id])
  end

  def new
    @category = params[:category]
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.category = params[:category].singularize
    if @work.save
      redirect_to category_path(@work.category.pluralize)
    else
      render :new
    end
  end

  def vote
    # check if a user a user has voted for a certain work
    if Vote.where(user_id: session[:user_id], work_id: params[:id]).empty?
      Vote.create(user_id: session[:user_id], work_id: params[:id])
      flash[:success] = "You voted successfully!"
    else
      flash[:failure] = "Sorry you can only vote once for this work."
    end
    redirect_to work_path
  end


  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description, :category)
  end
end
