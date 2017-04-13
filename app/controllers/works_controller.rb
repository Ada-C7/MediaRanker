class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def top_works
    @top_albums = Work.where(category: "album").order("-votes_count ASC").limit(10)
    @top_books = Work.where(category: "book").order("-votes_count ASC").limit(10)
    @top_movies = Work.where(category: "movie").order("-votes_count ASC").limit(10)
    @spotlight_work = Work.order("-votes_count ASC").first
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
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
    userid = session[:user_id]
    @user = User.find_by(id: userid)
  end

  def show_albums
    @all_albums = Work.where(category: "album").order("-votes_count ASC")
  end

  def show_books
    @all_books = Work.where(category: "book").order("-votes_count ASC")
  end
  def show_movies
    @all_movies = Work.where(category: "movie").order("-votes_count ASC")
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



  private
  def work_params
    return params.require(:work).permit(:id, :category, :title, :creator, :publication_year, :description)
  end

end
