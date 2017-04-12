class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    #@work.user_id = rand(100...200) #test
    @work.save
    if @work.save
      redirect_to send("#{@work.category}s_path")
    else
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id]) #changed to find_by; if not found -return nil
    if @work.nil?
      head :not_found
    end
  end

  def show_albums
    @all_albums = Work.where(category: "album")
  end

  def show_books
    @all_books = Work.where(category: "book")
  end
  def show_movies
    @all_movies = Work.where(category: "movie")
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update_attributes(work_params)
    if @work.save
      redirect_to work_path(@work)
    else
      render :edit, status: :bad_request
    end
  end

  def destroy
    work = Work.find(params[:id])
    if work.destroy
      redirect_to send("#{work.category}s_path")
    end
  end

  def upvote
    vote = Vote.new(work: @work, user: @user)
    vote.save # ???? save doesnt work
    if vote.save
      redirect_to root_path
    end
  end

  private
  def work_params
    return params.require(:work).permit( :category, :title, :creator, :publication_year, :description)
  end

end
