class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    @works = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      # We know the validations didn't pass
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to work_path(work)
  end

  def destroy
    work = Work.find(params[:id])
    work.destroy

    redirect_to works_path

  end

  def upvote
  end

  def upvote
    vote = Vote.create(user_id: session[:user_id], work_id: params[:id])

    if vote
      flash[:success] = "Vote"
      redirect_to params[:id]
    end

  end

  private
  def work_params
    return params.require(:work).permit( :title,:created_by,:description, :published, :category)
  end
end
