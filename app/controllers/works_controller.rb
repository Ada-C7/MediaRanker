class WorksController < ApplicationController

  before_action :find_work, only: [:edit, :update, :show, :destroy]

  def index
    @works = Work.all
  end

  def new
    # don't have to be logged in
    @work = Work.new
  end

  def create
    # don't have to be logged in
    @work = Work.new(work_params)
    if @work.title.match(/salmon/) || @work.title.match(/fish/)
      flash[:alix] = "Hi, Alix!"
    end
    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to "/works/#{@work.category}s"
    else
      params[:category] = @work.category
      render :new
    end
  end

  def edit
    # don't have to be logged in
    params[:category] = @work.category
  end

  def update
    # don't have to be logged in
    if @work.update(work_params)
      flash[:success] = "Successfully updated #{@work.category} #{@work.id}"
      redirect_to "/works/#{@work.category}s"
    else
      params[:category] = @work.category
      render :edit
    end
  end

  def show
    # don't have to be logged in
    if !@work
      render_404
    end
  end


  def destroy
    # don't have to be logged in
    @work.votes.each do |vote|
      vote.destroy
    end
    if @work.destroy
      flash[:success] = "Successfully destroyed #{@work.category} #{@work.id}"
      redirect_to "/works/#{@work.category}s"
    else
      flash[:error] = "Sorry, couldn't delete the #{@work.category}"
      render @work
    end
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

  def find_work
    @work = Work.find_by_id(params[:id])
  end

end
