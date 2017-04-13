class WorksController < ApplicationController
  def index
    @works = Work.all.sort_by do |work|
      -work.votes.count
    end
  end
  def top_work
    works = Work.all.sort_by do |work|
      -work.votes.count
    end
    @top_work = works.first
  end
  def works_index
    @works = Work.where(category: (params[:category]).singularize).sort_by do |work|
      -work.votes.count
    end
  end

  def vote
    upvote = Vote.new(user_id: session[:user_id], work_id: params[:id])

    if upvote.save
      flash[:success] = "You voted"
      redirect_to work_path(params[:id])
    else
      flash[:failure] = "You Already Voted for This Book!"
      redirect_to work_path(params[:id])
    end
  end

  def show
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
  end

  def new
    @work = Work.new
    @work.category = params[:category]
  end

  def create
    @work = Work.create(work_params)
    @work.category = params[:category].singularize

    if @work.save
      redirect_to works_path(@work.category)
    else
      render :new, status: :bad_request
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_params)

    if @work.save
      redirect_to works_path(@work.category.pluralize)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find(params[:id])
    @destroyed_category = work.category
    work.destroy

    redirect_to works_path(@destroyed_category)
  end

  private

  def work_params
    return params.require(:work).permit(:title, :created_by, :publication_year, :category, :description)
  end

end
