class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create(work_params)
    if @work.id != nil
      flash[:success] = "Successfully added"
      redirect_to send("#{@work.category}s_path")
    else
      flash[:failure] = "Work wasn't saves, try again"
      render :new, status: :bad_request
    end
  end

  def show
    @work = Work.find_by(id: params[:id]) #changed to find_by; if not found -return nil
    if @work.nil?
      head :not_found
    end
    userid = session[:user_id]
    @user = User.find_by(id: userid)
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
    userid = session[:user_id]
    @user = User.find_by(id: userid)
    @work = Work.find_by(id: params[:id])

    vote = Vote.create!(work: @work, user: @user)
    if vote.save
      redirect_to(:back) 
    end
  end

  private
  def work_params
    return params.require(:work).permit(:id, :category, :title, :creator, :publication_year, :description)
  end

end
