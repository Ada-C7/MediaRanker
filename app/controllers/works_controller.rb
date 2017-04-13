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
    Work.destroy(params[:id])

  redirect_to works_path
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
