class WorksController < ApplicationController
  before_action :top_work, only: [:index]

  def top_work
    if Work.all.length > 0
    most_votes = Work.all.sort_by { |work| -work.votes.count }.first
      if most_votes.votes.count > 5
        return @top_work = most_votes
      end
    end
  end

  def index
    @works = Work.all.sort_by do |work|
      -work.votes.count
    end
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
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
    end
  end

  def update
    @work = Work.find_by(id: params[:id])

    if @work.nil?
      head :not_found
    else
      @work.update_attributes(work_params)
      if @work.save
        redirect_to works_path(@work.category.pluralize)
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
      redirect_to root_path
    end
  end

  private

  def work_params
    return params.require(:work).permit(:title, :created_by, :publication_year, :category, :description)
  end

end
