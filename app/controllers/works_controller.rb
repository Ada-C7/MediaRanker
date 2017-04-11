class WorksController < ApplicationController

  # def movies
  # end
  #
  # def books
  # end
  #
  # def alubms
  # end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(works_params)

    if @work.save # is true - IE validations pass
      redirect_to homepage_path
    else
      # We know the validations didn't pass so want to show messages
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
    @work.update_attributes(works_params)

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
end
