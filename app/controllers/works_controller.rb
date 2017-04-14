class WorksController < ApplicationController
  def index
    @works = Work.all.sort { | b1, b2 | b2.votes.count <=> b1.votes.count }
    @movies = movies[0..9]
    @books = books[0..9]
    @albums = albums[0..9]
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.create work_params

    if @work.id != nil
      redirect_to root_path
    else
      render "new"
    end
  end

  def show
    @result_work = Work.find_by_id(params[:id])

    if !@result_work
      render_404
    end
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])

    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.year = work_params[:year]
    @work.description = work_params[:description]

    if @work.save
      redirect_to work_path(@work.id)
    else
      render "edit"
    end
  end

  def books
    @books = Work.where(category: 'book')
    @books.sort { | b1, b2 | b2.votes.count <=> b1.votes.count }
  end

  def movies
    @movies = Work.where(category: 'movie')
    @movies.sort { | m1, m2 | m2.votes.count <=> m1.votes.count }
  end

  def albums
    @albums = Work.where(category: 'album')
    @albums.sort { | a1, a2 | a2.votes.count <=> a1.votes.count }
  end

  def destroy
    Work.destroy(params[:id])
    votes = Vote.find_by_work_id(params[:id])
    votes.destroy

    redirect_to root_path
  end

  private

  def work_params
    params.require(:work).permit(:id, :category, :title, :creator, :year, :description)
  end

end
