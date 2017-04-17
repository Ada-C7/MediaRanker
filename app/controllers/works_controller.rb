class WorksController < ApplicationController
  def index
    @category = params[:works]
    @works = Work.order_by_votes(@category.singularize)
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
      flash[:success] = "Successfully created #{@work.title}"
      redirect_to works_path(@work.category.pluralize)
    else
      flash[:failure] = "Could not create #{@work.category}"
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
    if @work.nil?
      head :not_found
    else
      @work.update_attributes(work_params)
      if @work.save
        flash[:success] = "Successfully updated #{@work.title}"
        redirect_to works_path(@work.category.pluralize)
      else
        flash[:failure] = "Could not update #{@work.category}"
        render :edit, status: :bad_request
      end
    end
  end

  def destroy
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      category = work.category
      flash[:success] = "Successfully deleted #{category}"
      work.destroy
      redirect_to works_path(category.pluralize)
    end
  end

  def vote
    if session[:user_id] # user logged in
      vote = Vote.new(user_id: session[:user_id], work_id: params[:id])
      if vote.valid?
        flash[:success] = "Successfully upvoted!"
        vote.save
      else
        flash[:failure] = "Could not upvote: "
        flash[:error] = "user has already voted for this work"
      end
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
