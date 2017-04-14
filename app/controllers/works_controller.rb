class WorksController < ApplicationController

def index
  @works =  Work.all
end

def edit
  @work = Work.find_by_id(params[:id])
end

def show
  @work = Work.find_by_id(params[:id])

  if !@work
    render_404 #find me in ApplicationController
  end
end

def show_category
  @works = Work.where(category: params[:category])
end

def update
  work = Work.find_by_id(params[:id])

  if work.update(work_params)
    redirect_to work_path
  else
    render 'edit'
  end
end

def destroy
  work = Work.destroy(params[:id])
  redirect_to category_path(work.category)
end

def new
  @work = Work.new
end

def create
  @work = Work.new(work_params)

  if @work.save
    redirect_to work_path(@work.id)
  else
    render 'new'
  end
end

private

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publish_date)
end

end
