class WorksController < ApplicationController

  def index
    @works = Work.all
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
  end

  def category_index
    @works = Work.where(category: params[:category].singularize)
  end

  def new
    @work = Work.new
    @category = params[:category].singularize
  end

  def create
    @work = Work.create(work_params)
    @category = params[:work][:category].singularize
    if @work.save
      redirect_to :root
    else
      # puts "didn't save, #{@work.errors.messages}"
      render :back
    end
  end

  def show
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
    @category = @work.category
    if !@work
      render_404
    end
  end

  def update
    @work = Work.find_by_id(params[:id])
    # raise
    if !@work
      render_404
    end

    @category = params[:work][:category].singularize
    @work.update(work_params)
    if @work.save
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to :root
  end

  def upvote
  end

  private

  def work_params
    params.require(:work).permit(:category, :name, :created_by, :pub_year, :desc)
  end

end
