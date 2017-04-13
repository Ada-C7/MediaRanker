class WorksController < ApplicationController

  def index
    if params[:category] == 'all'
      @spotlight_work = Work.all.max_by { |work| work.votes.count }
      @categories = Work.all.map {|work| work.category}.uniq

    else
      @category = params[:category]
      @works = Work.where(category: @category).sort_by { |work| work.votes.count }.reverse

      render :category_index
    end
  end

  def new
    @work = Work.new
    @category = params[:category]
  end

  def create
    work = Work.new(work_params)
    work.category = params[:category]

    if work.save
      redirect_to work_path(work.id)
    else
      render :new
    end
  end

  def show
    @work = Work.find_by_id(params[:id])

    render_404 if @work.nil?
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  def update
    work = Work.find_by_id(params[:id])
    if work.update(work_params)
      redirect_to work_path(work.id)
    else
      render :edit
    end
  end

  def destroy
    work = Work.find_by_id(params[:id])
    category = work.category

    work.remove_votes
    work.destroy

    redirect_to works_path(category)
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :description, :creator, :publication_year)
  end

end
