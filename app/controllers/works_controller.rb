class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")

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
    # @category = params[:work][:category].singularize

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to new_work_path(params[:work][:category])

    else
      flash.now[:failure] = "A problem occurred: Could not create #{@work.category}"
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
    end
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
