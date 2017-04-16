class WorksController < ApplicationController
  def index
    @works = Work.all.sort {|d1, d2|  d2.votes.count <=> d1.votes.count}
  end

  def show
    @work=Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end

  end

  def show_category
    @categorized_works = []
    @works = Work.all
    @works.each do |work|
      if work.category == params[:category].singularize
        @categorized_works << work
      end
    end
    return @categorized_works
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params
    unless @work.id == nil
      redirect_to category_path(@work.category.pluralize)
    else
      render "new"
    end
  end

  def edit
    @work=Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    else
      params[:category] = @work.category
    end
  end

  def update
    @work = Work.find_by(id: params[:id])
    if (@work.nil?)
      head :not_found
    else
       @work.update_attributes(work_params)
       if @work.save
        redirect_to work_path(@work.id)
       else
        params[:category] = @work.category
        render :edit, status: :bad_request
       end
    end
  end



  def destroy
    work = Work.find_by(id: params[:id])
    if work.nil?
      head :not_found
    else
      category = work.category.pluralize
      Work.destroy(work.id)
      redirect_to category_path(category)
    end
  end


  private

  def work_params
    params.require(:work).permit(:id, :title, :created_by, :year_published, :description, :category)
  end

end
