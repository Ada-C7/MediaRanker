class AlbumsController < ApplicationController
  def index
    @works = Work.where(category: 'album')
  end

  def new
      @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    @work.category = 'album'
    if @work.save
      redirect_to :root
    else
      render :new
    end
  end

end
