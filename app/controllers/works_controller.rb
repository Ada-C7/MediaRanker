class WorksController < ApplicationController
  def index
    #create variable which looks up work by category use .order(votescount: :desc order)
    category = params[:category]
    @works = Work.where(category: category)
    @works.order(vote_count: :desc) #should I add a vote column to store vote count?
    render :index
  end

  # I need to add a by category method but not sure whether to add it here or model...
  # def by_category
  #   @works_by_category = Work.by_category(params[:category])
  # end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to welcome_path
    else
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
    if @work.nil?
      head :not_found
    end
  end

  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    work.save

    redirect_to welcome_path(work)
  end

  def destroy
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      work.destroy
      redirect_to welcome_path
    end
  end

    def upvote
      @work = Work.find(params[:id])
      @work.votes.create
      redirect_to welcome_path(work)
    end

    private
    def work_params
      return params.require(:work).permit(:title, :creator, :description)
    end
  end
