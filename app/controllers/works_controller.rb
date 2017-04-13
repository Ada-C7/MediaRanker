class WorksController < ApplicationController

  def index
    if params[:category] == 'all'
      @spotlight_work = Work.all.max_by { |work| work.votes.count }
      @categories = Work.all.map {|work| work.category}.uniq

    else
      @category = params[:category]
      @works = Work.where(category: @category)

      render :category_index
    end
  end

  def new
    @work = Work.new
  end

  def create
  end

  def show
    @work = Work.find_by_id(params[:id])

    render_404 if @work.nil?
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :description, :creator, :publication_year)
  end

end
