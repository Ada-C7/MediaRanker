class MoviesController < ApplicationController
  def index
    @works = Work.where(category: 'movie')
  end

  def new
      @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    @work.category = 'movie'
    if @work.save
      redirect_to :root
    else
      render :new
    end
  end 

end
