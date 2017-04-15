class WorksController < ApplicationController
  def index

    @works = Work.left_joins(:votes).group(:id).order('COUNT(votes.id) DESC')
    @albums = @works.where(category: "album").limit(10)
    @books = @works.where(category: "book").limit(10)
    @movies = @works.where(category: "movie").limit(10)
    # @albums = Work.where(category: "album").limit(10)
    # @books = Work.where(category: "book").limit(10)
    # @movies = Work.where(category: "movie").limit(10)



  end



  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    @work.category = session[:category]
    if @work.save
      redirect_to works_path
    else
      render :new
    end
  end

  def albums
    @works = Work.where(category: "album")
    session.delete(:category)
    session[:category] ||= "album"
    render "category"
  end

  def books
    @works = Work.where(category: "book")
    session.delete(:category)
    session[:category] ||= "book"
    render "category"
  end

  def movies
    @works = Work.where(category: "movie")
    session.delete(:category)
    session[:category] ||= "movie"
    render "category"
  end

  def show
    @work = Work.find_by(id: params[:id]) #returns nil
    if @work.nil?
      head :not_found
    end
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def edit
    @work = Work.find_by(id: params[:id])
    if @work.nil?
      head :not_found
    end
    session.delete(:return_to)
    session[:return_to] ||= request.referer
    @back_url = session[:return_to]
  end

  def update
    work = Work.find_by(id: params[:id])
    work.update_attributes(work_params)
    work.save
    # redirect_to session[:return_to]
    if session[:category] == "album"
      path = albums_path
    elsif session[:category] == "book"
      path = books_path
    elsif session[:category] == "movie"
      path = movies_path
    end
    redirect_to path

  end

  def destroy
    work = Work.find_by(id: params[:id])
    work.destroy
    redirect_to works_path
  end

  def upvote
    #if-else statement
    #Vote.where(user_id: ,work_id:  ).count == 0
  # Vote.new(user_id: ,work_id:  )
  #else
  #send error
  end



  #PRIVATE
  private
  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end


end # END of class WorksController
