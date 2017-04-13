class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album").limit(10)
    @books = Work.where(category: "book").limit(10)
    @movies = Work.where(category: "movie").limit(10)
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def albums
    @works = Work.where(category: "album")
    @category = "Albums"
    render "category"
  end

  def books
    @works = Work.where(category: "book")
    @category = "Books"
    render "category"
  end

  def movies
    @works = Work.where(category: "movie")
    @category = "Movies"
    render "category"
  end

  def show
    @work = Work.find_by(id: params[:id]) #returns nil
    if @work.nil?
      head :not_found
    end
  end

  def edit
    @work = Work.find_by(id: params[:id])
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def update
    work = Work.find_by(id: params[:id])
    work.update_attributes(work_params)
    work.save
    redirect_to session[:return_to]
  end

  def destroy
    work = Work.find_by(id: params[:id])
    work.destroy
    redirect_to works_path
  end



  #PRIVATE
  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end


end # END of class WorksController
