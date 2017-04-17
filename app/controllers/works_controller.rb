class WorksController < ApplicationController

  def show
    @work=Work.find(params[:id])
  end
  
  def edit
    @work=Work.find(params[:id])
  end

  def update
    @work=Work.find(params[:id])
    if @work.update(work_params)
      redirect_to works_path
    end
  end

  def destroy
    Work.destroy(params[:id])
    redirect_to root_path
  end

  private

  def work_params
    return params.require(:work).permit(:title, :publication_year, :description)
  end
end
