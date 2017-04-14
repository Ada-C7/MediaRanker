class WorksController < ApplicationController

  def index
    @works = Work.all
  end

  def new
    # don't have to be logged in
    @work = Work.new
    # session[:category] = params[:category]
  end

  def create
    # don't have to be logged in
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to "/works/#{@work.category}s"
    else
      params[:work] = @work
      params[:category] = @work.category
      render :new
    end

  end

  def show
    # don't have to be logged in
    @work = Work.find_by_id(params[:id])
    if !@work
      render_404
    end
  end

  def edit
    # don't have to be logged in
    @work = Work.find(params[:id])
  end

  def update
    # don't have to be logged in
    @work = Work.find(params[:id])
    if @work.update(work_params)
      redirect_to :root
    else
      render :edit
    end
  end

  def destroy
    # don't have to be logged in
    @work = Work.find(params[:id])
    @work.votes.each do |vote|
      vote.destroy
    end
    @work.destroy
    redirect_to :root
  end

  def movies
    @movies = Work.where(category: "movie").order('votes_count DESC')
  end

  def books
    @books = Work.where(category: "book").order('votes_count DESC')
  end

  def albums
    @albums = Work.where(category: "album").order('votes_count DESC')
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :published, :description, :category)
  end

end
