class WorksController < ApplicationController

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)

    if @book.save # is true - IE validations pass
      redirect_to books_path
    else
      # We know the validations didn't pass
      render :new
    end
  end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_params)

    # redirect_to work_path(@work)
  end

  def destory
    Work.find(params[:id]).destory
    # redirect_to
  end

private
  def works_params
    return params.required(:work).permit(:category,
                                         :title,
                                         :creator,
                                         :publication_year,
                                         :description)
end
