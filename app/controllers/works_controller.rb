class WorksController < ApplicationController
  def index
    # @works = Work.all
    super
    # @movies = Work.all.select {|work| work.category == "movie"}

    # @books = Work.all.select {|work| work.category == "book"}
    # @books.order(title: :desc)

    # @albums = Work.all.select {|work| work.category == "album"}
  end

  def show
    @result_work = Work.find(params[:id])
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params
    unless @work.id == nil
      redirect_to works_path
    end


  #   def index
  # ...
  # if params[:pending]
  #    # pending related stuff
  # end
  # if params[:live]
  #   # live related stuff
  # end
  # if params[:sold]
  #   # sold related stuff
  # end
  # ...
# end
  end

  def destroy
    work = Work.find(params[:id])
    category = work.category
    Work.destroy(params[:id])

    if category == "book"
      flash[:success] = "book deleted"
      redirect_to books_path
    elsif category == "album"
      flash[:success] = "album deleted"
      redirect_to albums_path
    elsif category == "movie"
      flash[:success] = "movie deleted"
      redirect_to movies_path
    end
  end

  def upvote
    @result_work = Work.find(params[:id])
    vote = Vote.new
    vote.user_id = session[:user_id]
    vote.work_id = paramas[:id]
    vote.save
    @result_work.vote += 1
    @result_work.save

    if vote.save && @result_work.save
      flash[:success] = "Successfully upvoted!"
      redirect_to work_path(@result_work.id)
    end

  end


  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    @work.title = work_params[:title]
    @work.creator = work_params[:creator]

    @work.description = work_params[:description]

    if @work.save
      redirect_to work_path(@work.id)
    # elsif @work.save && @work.category == "album"
    #   redirect_to albums_path
    # elsif @work.save && @work.category == "movie"
    #   redirect_to movies_path
    else
      render "edit"
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year)
  end
end
