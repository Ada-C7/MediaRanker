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
    @work.creator = work_params[:creator]
    @work = Work.find(params[:id])
    @work.title = work_params[:title]
    @work.publication_year = work_params[:publication_year]
    @work.description = work_params[:description]

    if @work.save
      flash[:updated] = "Book updated successfully"
      redirect_to book_path(@work.id)
    else
      render "edit"
    end
  end

  def upvote
  end

  def delete
  end



  private
  def work_params
    super
  end
end
