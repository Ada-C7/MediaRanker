class WorksController < ApplicationController
  def index
    @spotlight = spotlight[0]
    @movies = movies[0..9]
    @books = books[0..9]
    @albums = albums[0..9]
  end

  def new
    @work = Work.new(category: params[:category])
  end

  def create
    @work = Work.create work_params
    @work.category = params[:category]

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

  def show_category
    @works = Work.where(category: params[:category])
  end

  def new_category
    @work = Work.new
    @work.category = params[:category]

    if @work.id != nil
      redirect_to show_category_path
    else
      render "new"
    end
  end

  def edit
    @work = Work.find(params[:id])

    if !@work
      render_404
    end
  end

  def update
    @work = Work.find(params[:id])

    @work.category = work_params[:category]
    @work.title = work_params[:title]
    @work.creator = work_params[:creator]
    @work.year = work_params[:year]
    @work.description = work_params[:description]

    if @work.save
      flash[:success] = "#{ @work.category.capitalize } successfully updated!"
      redirect_to work_path(@work.id)
    else
      flash[:error] = "An error occurred"
      render "edit"
    end
  end

  def books
    books = Work.where(category: 'book')
    @books = books.sort { | b1, b2 | b2.votes.count <=> b1.votes.count }
  end

  def movies
    movies = Work.where(category: 'movie')
    @movies = movies.sort { | m1, m2 | m2.votes.count <=> m1.votes.count }
  end

  def albums
    albums = Work.where(category: 'album')
    @albums = albums.sort { | a1, a2 | a2.votes.count <=> a1.votes.count }
  end

  def spotlight
    spotlight = Work.all
    @spotlight = spotlight.sort { | s1, s2 | s2.votes.count <=> s1.votes.count }
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
