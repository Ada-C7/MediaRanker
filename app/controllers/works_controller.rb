class WorksController < ApplicationController
  def index
    @works = Work.all
    @movies = Work.all.select {|work| work.category == "movie"}

    @books = Work.all.select {|work| work.category == "book"}
    # @books.order(title: :desc)

    @albums = Work.all.select {|work| work.category == "album"}
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

  private

  def work_params
    params.require(:work).permit(:title, :creator, :description, :publication_year)
  end
end
