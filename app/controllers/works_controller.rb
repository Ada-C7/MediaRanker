class WorksController < ApplicationController
  def index
    # will need to order these by number of votes
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")

    #placeholder for picking top ranked work
    @spotlight = Work.all.sample
  end

  def show
    @work = Work.find_by_id(params[:id])

    if !@work
      render_404
    end
  end

  def category_index
      @works = Work.where(category: params[:category].singularize)
      # render_404 if ["movies", "books", "albums"].exclude?(params[:category])
  end

  def new
    @work = Work.new
    @work.category = params[:category].singularize
  end

  def create
    @work = Work.new(work_params)

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to new_work_path(params[:work][:category])
    else
      flash.now[:error] = "A problem occurred: Could not create #{@work.category}"
      render "new"
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  def update
    @work = Work.find_by_id(params[:id])

    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
      redirect_to category_path(@work.category)
    else
      flash.now[:error] = "A problem occurred: Could not update #{@work.category} #{@work.id}"
      render "edit"
    end
  end

  def destroy
    @work= Work.find_by_id(params[:id])
    Work.destroy(params[:id])

    flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"
    redirect_to category_path(@work.category)
  end

  def upvote
    if session[:user_id] = nil
      flash[:error] = "You must be logged in to do that"
      redirect_back(fallback_location: root_path)
    else
      vote = Vote.new
      # get user id from session
      vote.user_id = session[:user_id]
      # get work id from page/link

      # create new vote
      vote.save
      flash[:success] = "Successfully upvoted!"
      redirect_back(fallback_location: root_path)

    end
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
