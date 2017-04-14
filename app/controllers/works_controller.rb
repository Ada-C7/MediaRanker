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
      redirect_to works_path
    else
      render "new"
    end
  end

  def upvote
    if session[:user_id]
      vote = Vote.create(user_id: session[:user_id], work_id: params[:id])
      if vote.id
        flash[:success] = "Successfully upvoted!"
      else
        flash[:error] = "You've already voted for this"
      end
    else
      flash[:error] = "You must log in to do that"
    end
    redirect_back(fallback_location: root_path)
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :year_published, :description, :category)
  end
end
