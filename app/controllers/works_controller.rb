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
  @category = Work.find_by_id(params[:category])
end

def update
  work = Word.find_by_id(params[:id])

  if work.update(work_params)
    redirect category_path
  else
    render 'edit'
  end
end

def destroy
  Work.destroy(params[:id])

  redirect category_path
end

def new
  @work = Work.new
end

def create
  @work = Work.new

  if @work.create(work_params)
    redirect to work_path(@work.id)
  else
    render 'new'
  end
end

private

def work_params
  params.require(:work).permit(:category, :title, :creator, :description, :publish_date)
end

end
