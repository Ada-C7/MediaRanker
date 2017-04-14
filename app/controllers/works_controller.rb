class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.publication_year = work_params[:publication_year]
    @work.description = work_params[:description]

    if @work.save
      flash[:updated] = "Book updated successfully"
      redirect_to work_path(@work.id)
    else
      render "edit"
    end
  end

  def destroy
    work = Work.find(params[:id])
    #WIP.....you will likely use conditionals so you can redirect to the correct path
  end

  private
  def work_params
    media_params # In ApplicationController :)
  end
end
