class WorksController < ApplicationController
  def index
    @movies = Work.movies
    @albums = Work.albums
    @books = Work.books
  end

  def show
    @work = Work.find_by_id(params[:id])
    render_404 if !@work
  end

  def show_category
    @works = Work.where(category: params[:category].singularize)
    render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end

  def new
    @work = Work.new
    @category = params[:category].singularize
    render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end

  def create
    @work = Work.create work_params
    @category = params[:work][:category].singularize

    unless @work.id == nil
      flash[:success] = "Successfully created #{@category} #{@work.id}"
      redirect_to category_path(@category.pluralize)
    else
      flash.now[:error] = "Error: #{@category}.capitalize not created"
      render "new"
    end
  end

  def edit
    @work = Work.find(params[:id])
    @category = @work.category
    render_404 if !@work
  end

  def update
    @work = Work.find(params[:id])
    @category = @work.category

    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@category} #{@work.id}"
      redirect_to category_path(@work.category.pluralize)
    else
      flash.now[:error] = "Error: #{@category.capitalize} not updated"
      render "edit"
    end
  end

  def destroy
    work = Work.find(params[:id])
    category = work.category
    work.destroy
    flash[:success] = "Successfully destroyed #{category} #{params[:id]}"
    redirect_to category_path(category.pluralize)
  end

  def upvote
    if session[:user_id]
      @vote = Vote.create(user_id: session[:user_id], work_id: params[:id])
      if @vote.id
        flash[:success] = "Successfully upvoted!"
        redirect_back(fallback_location: root_path)
      else
        @work = Work.find(params[:id])
        flash.now[:error] = "You've already voted for this"
        render "show"
      end
    else
      flash[:error] = "You must log in to do that"
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :year_published, :description, :category)
  end
end
