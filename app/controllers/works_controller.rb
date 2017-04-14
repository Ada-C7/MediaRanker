class WorksController < ApplicationController
  def index
    @category = params[:works]
    @works = Work.where(category: @category.singularize)
  end

  def new
    @category = params[:works]
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @category = params[:works].singularize
    @work.category = @category

    if @work.save
      redirect_to works_path(@work.category.pluralize)
    else
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id])

    head :not_found if @work.nil?
  end

  def edit
    @work = Work.find_by(id: params[:id])

    head :not_found if @work.nil?
  end

  def update
    @work = Work.find_by(id: params[:id])
    @work.assign_attributes(work_params)

    if @work.save
      flash[:success] = "Successfully updated #{@work.title}"
      redirect_to works_path(@work.category.pluralize)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    else
      category = work.category
      work.destroy
      redirect_to works_path(category.pluralize)
    end
  end

  def vote
    if session[:user_id] # user logged in
      Vote.create(user_id: session[:user_id], work_id: params[:id])
      flash[:success] = "Successfully upvoted!"
    else
      flash[:failure] = "You must log in to upvote"
    end
    # category = Work.find(params[:id]).category.pluralize
    redirect_back(fallback_location: home_path)
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :publication_year, :description)
  end
end
