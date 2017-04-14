class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @books = Work.where(category: "book")
    @movies = Work.where(category: "movie")

    @spotlight = Work.all.sample
  end

  def show
    @work = Work.find_by_id(params[:id])

    if !@work
      render_404
    end
  end

  #show_category
  # @works = Work.where(category: params[:category].singularize)
  # render_404 if ["movies",].exclude?(params[:category])


  def create
    @work = Work.new(work_params)
    # @category = params[:work][:category].singularize

    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      if @work.category = "book"
        redirect_to books_path
      elsif @work.category = "movie"
        redirect_to movies_path
      elsif @work.category = "album"
        redirect_to albums_path
      else
        redirect_to works_path
      end
    else
      flash.now[:failure] = "A problem occurred: Could not create #{@work.category}"
      if @work.category = "book"
        render "books/new"
      elsif @work.category = "movie"
        render "movies/new"
      elsif @work.category = "album"
        render "albums/new"
      else
        render "index"
      end
      # render "new"
    end
  end

  def edit
    @work = Work.find_by_id(params[:id])
  end

  private

  def work_params
    params.require(:work).permit(:category, :title, :creator, :pub_year, :description)
  end
end
