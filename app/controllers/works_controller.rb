class WorksController < ApplicationController
  def index

  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.save
    # if @work.save
    #   redirect_to welcome_path
    # else
    #   render :new
    # end
  end

  def show
    # @work = Work.find()
  end

  def edit

  end

  def update


  end

  def destroy

  end

end
